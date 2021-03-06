if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
 document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-lists');

  // 選択した画像を表示する関数
  const createImageHTML = (blob) => {
    // 画像を表示するためのdiv要素を生成
   const imageElement = document.createElement('div');
   imageElement.setAttribute('class', "image-element")
   let imageElementNum = document.querySelectorAll('.image-element').length

   // 表示する画像を生成
   const blobImage = document.createElement('img');
   blobImage.setAttribute('src', blob);
   blobImage.setAttribute('class', 'preview');

   // ファイル選択ボタンを生成
   const inputHTML = document.createElement('input')
   inputHTML.setAttribute('id', `diary-image-${imageElementNum}`)
   inputHTML.setAttribute('class', "image-input")
   inputHTML.setAttribute('name', 'diary[images][]')
   inputHTML.setAttribute('type', 'file')

   // 生成したHTMLの要素をブラウザに表示させる
   imageElement.appendChild(blobImage)
   imageElement.appendChild(inputHTML)
   ImageList.appendChild(imageElement)

   inputHTML.addEventListener('change', (e) => {
    file = e.target.files[0];
    blob = window.URL.createObjectURL(file);

    createImageHTML(blob)
  })
 };

  document.getElementById('diary-image').addEventListener('change', function(e){

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createImageHTML(blob);
  });
 });
};