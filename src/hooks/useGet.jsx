import { useState, useEffect, useCallback } from "react";
import { invoke } from "@tauri-apps/api/tauri";

const useGet = ({
  func,
  payload = null,
  id = null,
  launch = true,
  onSuccess = () => {}
}) => {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [errors, setErrors] = useState(null);

  const fetch = useCallback(async () => {
    setLoading(true);

    await invoke(func, { id })
      .then((response) => {
        setErrors(null);
        setData(response);
        onSuccess(response);
      })
      .catch((error) => {
        setErrors(error.message);
      })
      .finally(() => {
        setLoading(false);
      });
  }, [id, func, payload, onSuccess]);

  useEffect(() => {
    if (launch) {
      fetch();
    }
  }, [launch, id, func]); // eslint-disable-line

  return [data, loading, errors, fetch];
};

export { useGet };
