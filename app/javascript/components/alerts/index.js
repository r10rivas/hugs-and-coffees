import React, { useState } from "react";
import Alert from "./alert";

export default function Alerts({ alerts }) {
  const [data, setDataAlerts] =  useState(buildData());
  const [active, setActive] =  useState(true);

  function generateUUID () {
    return `${Date.now()}${(Math.random()*100000).toFixed()}`
  }

  function buildData () {
    return (
      alerts.map(notification => {
        return ({
          kind: notification[0],
          messages: Array.isArray(notification[1]) ? [...notification[1]] : [notification[1]],
          id: generateUUID()
        })
      })
    )
  }

  function buildAlerts() {
    return data.map(alert => (
      <Alert
        key={alert.id}
        id={alert.id}
        type={alert.kind}
        messages={alert.messages}
        closeCallback={handleCloseAlert}
      />
    ))
  }

  function handleCloseAlert (notificationID) {
    const dataUpdated = data.filter(notification => notification.id != notificationID);
    setDataAlerts(dataUpdated);
    setActive(dataUpdated.length > 0);
  }

  return (
    <div className={`fixed z-10 inset-0 ${active ? 'flex' : 'hidden'} items-end justify-center px-4 py-6 pointer-events-none sm:p-6 sm:items-start sm:justify-end`}>
      <div className="max-w-sm w-full">
        { buildAlerts() }
      </div>
    </div>
  )
}
