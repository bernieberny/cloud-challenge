const p = document.querySelector("#visit-counter");
VISITORS_ENDPOINT =
  "https://9rb3gd5fik.execute-api.us-east-1.amazonaws.com/default/incrementVisitors";

const updateCounter = async (event) => {
  const response = await fetch(VISITORS_ENDPOINT, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
  });
  const visitors = await response.json();
  p.textContent = `This page has been visited ${visitors.quantity} times`;
};

window.addEventListener("DOMContentLoaded", updateCounter);