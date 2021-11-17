import React, { useState, useEffect } from "react";

function Navbar({ options, userData }) {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  useEffect(() => {
    const body = document.querySelector("body");
    body.classList.toggle("overflow-y-hidden", isMenuOpen);

    return () => {
      body.classList.remove("overflow-y-hidden");
    }
  }, [isMenuOpen]);

  const openMenu = (e) => {
    e.stopPropagation();
    setIsMenuOpen(true);
  }

  const closeMenu = (e) => {
    e.stopPropagation();
    setIsMenuOpen(false);
  }

  const _handleClickSidebar = (e) => {
    e.stopPropagation();
  }

  const _buildOptions = () => {
    return (
      options.map((option, index) => (
        <li className="flex" key={index}>
          <a
            className={`p-4 w-full flex items-center text-gray-500 hover:text-app-pink hover:bg-app-pink hover:bg-opacity-20 ${option.active ? 'text-app-pink bg-app-pink bg-opacity-20' : ''}`}
            href={option.path}
            data-method={option.method}
            data-confirm={option.confirm}
          >
            <span className="font-semibold capitalize">{option.label}</span>
          </a>
        </li>
      ))
    )
  }

  return (
    <React.Fragment>
      <header className="w-full h-16 fixed top-0 z-10 bg-app-pink">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-12 gap-1">
            {/* start button open mobile menu */}
            <div className="col-span-2 lg:hidden">
              <div className="w-full h-full flex items-center">
                <button className="ml-1 p-2 sm:ml-2 sm:p-4 text-white" id="show-sidebar" onClick={openMenu}>
                  <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16" />
                  </svg>
                </button>
              </div>
            </div>
            {/* end button open mobile menu  */}
            {/* start brand */}
            <div className="col-start-6 col-end-8 lg:block lg:col-span-3">
              <div className="w-full h-16 sticky top-0 border-gray-200 flex items-center justify-center text-white text-xl font-happy-monkey font-semibold lg:border-r">
                H&C
              </div>
            </div>
            {/* end brand */}

            {/* start user section */}
            <div className="hidden lg:block lg:col-start-10 lg:col-end-13">
              <div className="w-full h-16 sticky top-0 border-l border-gray-200 flex items-center justify-center">
                <div className="flex items-center px-4">
                  <div className="flex-shrink-0 min-w-0">
                    <img alt="User image" className="h-10 w-10 bg-white border border-red-700 rounded-full" src={userData.image}>
                    </img>
                  </div>
                  <div className="ml-3 min-w-0">
                    <p className="text-base font-medium text-gray-800 truncate">
                      {userData.user}
                    </p>
                  </div>
                </div>
              </div>
            </div>
            {/* end user section */}
          </div>
        </div>
      </header>

      <div className={`bg-black bg-opacity-50 h-screen w-full fixed z-50 top-0 -left-full transition-nav-menu lg:hidden ${isMenuOpen ? 'active' : ''}`} id="sidebar-wrapper" onClick={closeMenu}>
        <div className="w-3/4 h-full text-sm bg-white sm:w-64" id="sidebar" onClick={_handleClickSidebar}>
          <div className="w-full h-16 px-4 flex justify-start items-center border border-t-0 border-l-0 border-r-0 border-gray bg-app-pink">
            <button id="hide-sidebar" type="button" className="inline-flex items-center justify-center p-2 rounded-full text-white hover:bg-gray-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-900 focus:ring-white" aria-controls="mobile-menu" aria-expanded="false" onClick={closeMenu}>
              <span className="sr-only">Open main menu</span>
              {/* 
                Heroicon name: outline/menu

                Menu open: "hidden", Menu closed: "block"
               */}
              <svg className="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16" />
              </svg>
              {/*
                Heroicon name: outline/x

                  Menu open: "block", Menu closed: "hidden"
               */}
              <svg className="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
          <ul className="">
            {_buildOptions()}
          </ul>

        </div>
      </div>
    </React.Fragment>
  )
}

export default Navbar
