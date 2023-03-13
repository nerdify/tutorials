const $skeletonContainer = document.querySelector(".skeleton_container");

const $profileContainer = document.querySelector(".profile_container");

const $profileImage = document.querySelector(".profile .image img");
const $profileName = document.querySelector(".profile .text_name");

fetch("https://randomuser.me/api/")
  .then(response => {
    return response.json();
  })
  .then(data => {
    const { name, picture } = data.results[0];

    $profileImage.src = picture.large;
    $profileName.innerText = `${name.first} ${name.last}`;

    setTimeout(() => removeSkeletons(), 5000);
  });

function removeSkeletons() {
  $skeletonContainer.classList.add("hidden");

  $profileContainer.classList.remove("hidden");
}
