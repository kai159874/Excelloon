document.addEventListener("turbolinks:load", function() {
  const createImageHTML = (blob) => {
    const imageElement = document.getElementById('image-preview');
    const blobImage = document.createElement('img');
    blobImage.setAttribute('class', 'image-preview');
    blobImage.setAttribute('src', blob);

    imageElement.appendChild(blobImage);
  };

  let input = document.getElementById('file-input')
  if (!input){ return false;}

  document.getElementById('file-input').addEventListener('change', (e) => {
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    createImageHTML(blob);
  });
});