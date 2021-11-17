import React from "react";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "./custom-styles.css";

function ImagesCarrousel({imagesData}) {
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
      <figure className="relative inline-block overflow-hidden mt-4 mx-auto w-full min-w-72 max-w-72 sm:min-w-80 sm:max-w-80 md:max-w-92">
        <div className="h-72">
          <img className="rounded-lg" src={item.image}></img>
          <h3 className="italic line-clamp-3">{item.subtitule}</h3>
        </div>
      </figure>
    )
  }

  const _buildCardsCollection = () => {
    if (imagesData.length > 0) {
      return (
        imagesData.map((imageData, index) => (
          <div key={index}>
            {_buildCard(imageData)}
          </div>
        ))
      )
    }

    return ( 
      <p className="px-4 py-10">
        No tiene imágenes registradas
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

export default ImagesCarrousel
