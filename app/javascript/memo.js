//既読機能と同様にwindowをload時に実行される
function memo(){
  //index.html.erbのform.submitのidをgetElementByIdで取得
  const submit = document.getElementById("submit")
  //クリックされたときに実行される関数の定義
  submit.addEventListener("click", (e) => {
   const formData = new FormData(document.getElementById("form"));
   const XHR = new XMLHttpRequest();
   XHR.open("POST", "/posts", true);
   XHR.responseType = "json";
   XHR.send(formData);
   XHR.onload = () => {
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    }
    //レスポンスとして返却されためものレコードデータの取得
    const item = XHR.response.post;
    //HTMLを描画する親要素の取得
    const list = document.getElementById("list");
    //入力フォームのリセットの為content要素の取得
    const formText = document.getElementById("content");
    
    //メモとして描画する部分のHTMLをHTMLという変数で処理
    const HTML = `
      <div class="post" data-id=${item.id}>
        <div class="post-date">
          投稿日時：${item.created_at}
        </div>
        <div class="post-content">
        ${item.content}
        </div>
      </div>`;
    //listの直後に挿入
    list.insertAdjacentHTML("afterend", HTML);
    //入力フォームに残った文字はからの文字列に上書き（＝フォームはリセットされる）
    formText.value = "";
  };
  e.preventDefault();
  });
}
window.addEventListener("load",memo)