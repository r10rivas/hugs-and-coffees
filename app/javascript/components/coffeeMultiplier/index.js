import React, {useState, useEffect} from "react";
import coffeeImage from "./../../images/coffee.svg";

function CoffeeMultiplier({coffee, currencySymbol}) {
  const [totalCoffee, setTotalCoffee] = useState(null);

  const [currentMultiplier, setCurrentMultiplier] = useState(1);

  useEffect(() => {
    const total = coffee * currentMultiplier;

    setTotalCoffee(total);

  }, [currentMultiplier])

  const handleClick = (multiplier) => {
    setCurrentMultiplier(multiplier);
    console.log(multiplier)
  }

  return (
    <div className="w-full mt-6">
      <input type="hidden" defaultValue={totalCoffee} name="coffee[total]"></input>
      <input type="hidden" defaultValue={currentMultiplier} name="coffee[quantity]"></input>
      <div className="w-full flex items-center">
        <img className="w-10 sm:w-12" src={coffeeImage}></img>

        <span className="font-happy-monkey font-bold mx-3">X</span>

        <div className="flex">
          <div
            className={`m-1 rounded-full bg-white border border-app-pink w-9 h-9 flex justify-center items-center cursor-pointer hover:border-white hover:bg-app-pink hover:text-white sm:w-11 sm:h-11 sm:m-2 ${currentMultiplier == 1 ? 'bg-app-pink text-white' : ''}`}
            onClick={()=>{ handleClick(1) }}
          >
            1
          </div>
          <div
            className={`m-1 rounded-full bg-white border border-app-pink w-9 h-9 flex justify-center items-center cursor-pointer hover:border-white hover:bg-app-pink hover:text-white sm:w-11 sm:h-11 sm:m-2 ${currentMultiplier == 2 ? 'bg-app-pink text-white' : ''}`}
            onClick={()=>{ handleClick(2) }}
          >
            2
          </div>
          <div
            className={`m-1 rounded-full bg-white border border-app-pink w-9 h-9 flex justify-center items-center cursor-pointer hover:border-white hover:bg-app-pink hover:text-white sm:w-11 sm:h-11 sm:m-2 ${currentMultiplier == 3 ? 'bg-app-pink text-white' : ''}`}
            onClick={()=>{ handleClick(3) }}
          >
            3
          </div>
          <div
            className={`m-1 rounded-full bg-white border border-app-pink w-9 h-9 flex justify-center items-center cursor-pointer hover:border-white hover:bg-app-pink hover:text-white sm:w-11 sm:h-11 sm:m-2 ${currentMultiplier == 5 ? 'bg-app-pink text-white' : ''}`}
            onClick={()=>{ handleClick(5) }}
          >
            5
          </div>
        </div>
      </div>
      <div className="mt-2">
        <span className="text-gray-700">{`${coffee} ${currencySymbol}`}</span>
      </div>
      <div className="mt-2">
        <span className="font-bold">{`Total: ${totalCoffee} ${currencySymbol}`}</span>
      </div>
    </div>
  )
}

export default CoffeeMultiplier
