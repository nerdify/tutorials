const $skeletons = document.querySelectorAll(".skeleton");

const $profileItems = document.querySelectorAll(".profile");

console.log($skeletons);

setTimeout(() => {
  $skeletons.forEach($skeleton => {
    $skeleton.classList.remove("skeleton");
    $skeleton.classList.add("hidden");
  });

  $profileItems.forEach($profileItem => {
    $profileItem.classList.remove("hidden");
  });
}, 3000);
