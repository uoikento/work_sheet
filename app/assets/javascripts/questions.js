// $(document).on('turbolinks:load', ()=> {
//   // 画像用のinputを生成する関数
//   const buildFileField = (index)=> {
//     const html = `<div data-index="${index}" class="js-file_group">
//                     <input class="half-form" type="text" 
//                     name="question[options_attributes][${index}][title]"
//                     id="question_options_attributes_${index}_title">
//                   </div>`;
//     return html;
//   }

//   // file_fieldのnameに動的なindexをつける為の配列
//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];

//   $('#option-box').on('click keydown', '.half-form', function (e) {
//     if (typeof e.keyCode === "undefined" || e.keyCode === 13) {
//       // fileIndexの先頭の数字を使ってinputを作る
//       $('#option-box').append(buildFileField(fileIndex[0]));
//       fileIndex.shift();
//       // 末尾の数に1足した数を追加する
//       fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
//     }
//   });

//   $(".new-form").keydown(function (e) {
//     if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
//       return false;
//     } else {
//       return true;
//     }
//   });
// });
