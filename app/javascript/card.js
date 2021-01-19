const pay = () => {
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("あああ")
  });
};

window.addEventListener("load", pay)