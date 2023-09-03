import React from "react";

export const Inventory = ({ display = false }) => {
  if (!display) {
    return null;
  }
  return <div>Inventory</div>;
};
