import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const HTML = `
      <div class="comments">
       <div class="comment-text">${data.content.text}</div>
       <div class="comment-user">${data.content.nickname}</div>
       <div class="comment-time">${data.content.created_at}</div>
      </div>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment-send');
    const submit = document.getElementById('comment-submit')
    comments.insertAdjacentHTML("afterend", HTML);
    newComment.value='';
    submit.removeAttribute('disabled');
  }
});
