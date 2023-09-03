import React from "react";

export const Character = ({ display = false }) => {
  if (!display) {
    return null;
  }
  return <div>Character</div>;
};
