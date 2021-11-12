import React from "react";

class Dropdown extends React.Component {
  constructor(props) {
    super(props);

    this.buttonDropdown = React.createRef();
    this.state = {
      isOpen: false,
    }

    this._handleClickOutside = this._handleClickOutside.bind(this);
    this._handleClick = this._handleClick.bind(this);
  }

  componentDidMount() {
    document.addEventListener('mousedown', this._handleClickOutside);
  }

  componentWillUnmount() {
    document.removeEventListener('mousedown', this._handleClickOutside);
  }

  _handleClickOutside(event) {
    if (this.buttonDropdown.current
        && !this.buttonDropdown.current.contains(event.target)
        && this.state.isOpen) {
      this.setState({isOpen: false});
    }
  }

  _handleClick(event) {
    event.stopPropagation();
    this.setState({isOpen: !this.state.isOpen})
  }

  _buildOptions() {
    const { options } = this.props;
    return (
      options.map((option, index) => (
        <a
          className="text-gray-700 block px-4 py-2 text-sm"
          role="menuitem"
          tabIndex="-1"
          key={index}
          href={option.path}
          data-method={option.method}
          data-confirm={option.confirm}
        >
          { option.label }
        </a>
      ))
    )
  }

  render() {
    return(
      <div 
        className="relative inline-block text-left" 
        ref={this.buttonDropdown}
      >
        <div>
          <button
            onClick={this._handleClick}
            className="inline-flex justify-center w-full rounded-md shadow-sm p-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-app-pink"
            id="menu-button"
            type="button"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="h-6 w-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"
              />
            </svg>
          </button>
        </div>
        <div
          aria-orientation="vertical"
          aria-labelledby="menu-button"
          className={`${this.state.isOpen ? '' : 'hidden'} origin-top-right absolute z-10 right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 divide-y divide-gray-100 focus:outline-none`}
          role="menu"
          tabIndex="-1"
        >
          <div className="py-1" role="none">
            { this._buildOptions() }
          </div>
        </div>
      </div>
    )
  }
}

export default Dropdown;
