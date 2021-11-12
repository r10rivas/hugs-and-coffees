import React, { useState } from "react"

// Import React FilePond
import { FilePond, registerPlugin } from "react-filepond"

// Import FilePond styles
import "filepond/dist/filepond.min.css"

// Import the plugin code
import FilePondPluginImagePreview from "filepond-plugin-image-preview/";
import FilepondPluginFileValidateType from "filepond-plugin-file-validate-type";

// Import the plugin styles
import "filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css";

// Register the plugin
registerPlugin(FilePondPluginImagePreview, FilepondPluginFileValidateType);

function FormImage({ name, imagesFile }) {
  const [files, setFiles] = useState(_buildFilesLocal());

  function _buildFilesLocal() {
    return(
      imagesFile.map(file => (
        { 
          source: file,
          options: { type: 'local' } 
        }
      ))
    )
  }

  return (
    <div className="mt-1">
      <FilePond
        acceptedFileTypes={[["image/jpg", "image/jpeg", "image/png"]]}
        labelFileTypeNotAllowed="File of invalid type"
        required={true}
        files={files}
        onupdatefiles={setFiles}
        allowMultiple={false}
        maxFiles={1}
        // addFile={addFile}
        name={name}
        labelIdle='Drag & Drop your files or <span class="filepond--label-action">Browse</span>'
        server={{
          url: "/api/images_uploads",
          process(fieldName, file, _metadata, load, error, progress, abort, _transfer, _options) {
            // fieldName is the name of the input field
            // file is the actual file object to send
            const formData = new FormData();
            formData.append(fieldName, file, file.name);
            formData.append('image[filename]', file.name);

            let request = new XMLHttpRequest();

            request.open('POST', '/api/images_uploads');
            request.responseType = 'json';

            // Should call the progress method to update the progress to 100% before calling load
            // Setting computable to false switches the loading indicator to infinite mode
            request.upload.onprogress = (e) => {
                progress(e.lengthComputable, e.loaded, e.total);
            };

            // Should call the load method when done and pass the returned server file id
            // this server file id is then used later on when reverting or restoring a file
            // so your server knows which file to return without exposing that info to the client
            request.onload = function () {
                if (request.status >= 200 && request.status < 300) {
                    // the load method accepts either a string (id) or an object
                    load(request.response.id);
                } else {
                    // Can call the error method if something is wrong, should exit after
                    error('oh no');
                }
            };

            request.send(formData);

            // Should expose an abort method so the request can be cancelled
            return {
                abort: () => {
                    // This function is entered if the user has tapped the cancel button
                    request.abort();

                    // Let FilePond know the request has been cancelled
                    abort();
                },
            };
          },
          revert: null,
          fetch: null,
          load: {
            url:  '/',
          }
        }}
      />
    </div>
  )
}

export default FormImage
