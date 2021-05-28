function showMessageModal(title, message, positiveText) {
    document.getElementById('modal_title').textContent = title;
    document.getElementById('modal_message').textContent = message;
    document.getElementById('modal_positive_button').textContent = positiveText;

    document.getElementById('modal_negative_button').style.display = 'none';

    $("#common_modal").modal();
}