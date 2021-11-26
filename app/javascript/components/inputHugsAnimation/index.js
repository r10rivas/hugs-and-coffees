import React, {useState, useEffect, useRef} from "react";
import hugsAnimation from "./../../images/hug-animation.svg";


function useInterval(callback, delay) {
  const savedCallback = useRef();

  useEffect(() => {
    savedCallback.current = callback;
  }, [callback]);

  useEffect(() => {
    function tick() {
      savedCallback.current();
    }
    if (delay !== null) {
      let id = setInterval(tick, delay);
      return () => clearInterval(id);
    }
  }, [delay]);
}

function InputHugsAnimation() {

  const water = useRef(null);

  const [isMouseDown, setMouseDown] = useState(false);

  const [value, setValue] = useState(0);

  const [total, setTotal] = useState(0);

  const [hugsTotal, setHugsTotal] = useState(0);

  const onMouseDown = () => {
    console.log("mouse is down");
    setTotal(total + 1);
    setValue(value + 1);

    // Todo-refactor: Use useState
    setHugsTotal(Math.round(((total * 60/100) + Number.EPSILON) * 100) / 100)

    water.current.style.transform='translate(0'+','+(100-value)+'%)';

    if (value == 100) {
      setValue(0);
    }
    console.log(value, total, hugsTotal);
  };

  useInterval(onMouseDown, isMouseDown ? 100 : null);

  return (
    <div className="w-full flex flex-col items-center">
      <div
        className="relative w-64 h-64 sm:w-80 sm:h-80 rounded-full flex justify-center items-center overflow-hidden border-2"
        onMouseDown={() => setMouseDown(true)}
        onMouseUp={() => setMouseDown(false)}
      >
        <input type="hidden" name="hug[duration]" defaultValue={hugsTotal}></input>
        <div
          className="absolute inset-0 bg-app-pink transform translate-y-full"
          ref={water}
        >
        </div>
        <img
          className="z-10 outline-none w-52 h-52 sm:w-60 sm:h-60"
          src={hugsAnimation}
        >
        </img>
      </div>
      <div className="mt-4">
        <h4 className="font-happy-monkey text-center">{`${hugsTotal} second hug`}</h4>
        <p className="mt-4">The longer you press it (the image), the greater the hug.</p>
      </div>
    </div>
  )
}

export default InputHugsAnimation
