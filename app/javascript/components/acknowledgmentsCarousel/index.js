import React from "react";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "./custom-styles.css";
import coffee from "./../../images/coffee.svg";

function AcknowledgmentsCarrousel({acknowledgments}) {
  let settings = {
    dots: false,
    infinite: false,
    accessibility: true,
    lazyLoad: true,
    slidesToShow: 2,
    slidesToScroll: 1,
    responsive: [
      {
        breakpoint: 840,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  };

  const _buildCard = (item) => {
    return (
      <figure className="relative inline-block overflow-hidden mt-4 mx-auto w-full min-w-72 max-w-72 sm:min-w-80 sm:max-w-80 md:max-w-92 bg-white p-4 rounded-md shadow-md">
        <div className="h-48 sm:h-56">
          <div className="flex justify-between">
            <div className="flex flex-col min-w-0">
              <span className="block text-left font-semibold truncate">{item.name}</span>
              <span className="block text-left truncate">{item.occupation}</span>
            </div>
            <div className="h-14 ml-3 relative">
              <img className="h-full" src={coffee}></img>
              <div className="w-6 h-6 bg-white border border-app-pink rounded-full absolute -right-2 -top-1.5">
                {item.quantity}
              </div>
            </div>
          </div>
          <p className="mt-3 italic line-clamp-5 sm:line-clamp-6 text-left">{item.message}</p>
        </div>
      </figure>
    )
  }

  const _buildCardsCollection = () => {
    if (acknowledgments.length > 0) {
      return (
        acknowledgments.map((acknowledgment, index) => (
          <div key={index}>
            {_buildCard(acknowledgment)}
          </div>
        ))
      )
    }

    return ( 
      <p className="mt-12 mb-6 px-4 py-10">
        It has not received any recognition.
      </p>
    )
  }

  return (
    <div className="w-full max-w-5xl m-auto text-center">
      <div className="">
        <Slider {...settings}>
          { _buildCardsCollection() }
        </Slider>
      </div>
    </div>
  )
}

export default AcknowledgmentsCarrousel
