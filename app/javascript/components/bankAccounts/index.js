import React, {useState, useEffect} from "react";

function CoffeeInfo({accounts}) {
  const [currentAccount, setCurrentAccount] = useState(accounts[0].account_id);
  const [dataAccount, setDataAccount] = useState(null);

  useEffect( async () => {
    const response = await fetch(`/api/accounts/${currentAccount}`);
    const data = await response.json();

    setDataAccount(data);
  }, [currentAccount]);

  const buildBankOptions = () => {
    return (
      accounts.map(account => (
        <option value={account.account_id} key={account.account_id}>
          {account.bank_name}
        </option>
      ))
    )
  };

  const _buildDisplayAccount = () => {
    if (dataAccount !== null) {
      return (
        <div>
          <input
            type="hidden"
            defaultValue={currentAccount}
            name="coffee[account_id]"
          >
          </input>

          <p className="mt-2 first:mt-0">
            <span className="mr-2 text-sm font-bold text-gray-700">
              Email:
            </span>
            <span className="text-sm font-medium text-gray-700">
              {dataAccount.email}
            </span>
          </p>
          <p className="mt-2 first:mt-0">
            <span className="mr-2 text-sm font-bold text-gray-700">
              Number account:
            </span>
            <span className="text-sm font-medium text-gray-700">
              {dataAccount.number}
            </span>
          </p>
          <p className="mt-2 first:mt-0">
            <span className="mr-2 text-sm font-bold text-gray-700">
              DNI:
            </span>
            <span className="text-sm font-medium text-gray-700">
              {dataAccount.dni}
            </span>
          </p>
          <p className="mt-2 first:mt-0">
            <span className="mr-2 text-sm font-bold text-gray-700">
              Account type:
            </span>
            <span className="text-sm font-medium text-gray-700">
              {`${dataAccount.kind == 'saving' ? 'Ahorro' : 'Corriente'}`}
            </span>
          </p>
        </div>
      )
    }

    return (
      <p className="block text-sm font-medium text-gray-700">
        It does not have registered accounts.
      </p>
    )
  }

  const handleChangeBank = (e) => {
    setCurrentAccount(e.target.value);
  }

  return (
    <div className="">
      <div className="my-3">
        <label className="block text-sm font-medium text-gray-700">
          Banking entity:
        </label>
        <select
          className="mt-1 focus:ring-app-pink focus:border-app-pink block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
          onChange={handleChangeBank}
        >
          {buildBankOptions()}
        </select>
      </div>
      {_buildDisplayAccount()}
    </div>
  )
}

export default CoffeeInfo
