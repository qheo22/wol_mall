$(document).ready(function () {
    //	tooltip
    $('[data-toggle="tooltip"]').tooltip();

    // table
    $('.table > tbody > tr').hover(function () {
        $(this).find('.btn_list_edit').show();
    }, function () {
        $(this).find('.btn_list_edit').hide();
    });

    //	drop down
    $('.drop_hover').hover(function () {
            $(this).children('.drop_menu').addClass('on');
        },
        function () {
            $(this).children('.drop_menu').removeClass('on');
        }
    );

    //	close box
    $('.close_box').find('button.close').click(function () {
        // $(this).parents('.close_box').hide();
    });

    //  pwd-eye
    $('.input_group i.eye').on('click', function () {
        $('input').toggleClass('active');
        if ($('input').hasClass('active')) {
            $(this).attr('class', "eye hide").prev('input').attr('type', "text");
        } else {
            $(this).attr('class', "eye").prev('input').attr('type', 'password');
        }
    });


    // Modal - Message   component.html > Varying modal content  참고
    $('#Modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        var modal = $(this)
        modal.find('.modal-title').text('New message to ' + recipient)
        modal.find('.modal-body input').val(recipient)
    });

    jQuery.expr[':'].contains = function(a, i, m) {
        return jQuery(a).text().toUpperCase()
            .indexOf(m[3].toUpperCase()) >= 0;
    };
});

function showSuccessView() {
    $("#response_box_success").fadeIn(function () {
        setTimeout(() => $("#response_box_success").fadeOut(), 2000);
    });
}

function onClickClose(view) {
    $("#" + view.parentElement.id).fadeOut()
}

function scrollToTop() {
    window.scrollTo({top: 0, behavior: 'smooth'});
}

function checkSize(input, limit) {
    console.log("test = " + input.files[0].size)
    return null != input.files && input.files && input.files[0].size > (limit * 1024 * 1024);
}

// 저장된 offset 까지 스크롤 하기
function scrollToOffset() {
    let offset = $('#scroll_offset').attr('value');
    console.log('현재 스크롤 Y 값 가져오기 = ' + offset);
    window.scrollTo(0, offset);
}

// 현재 스크롤 위치 저장
function setCurrentScrollY() {
    let offset = window.scrollY;
    console.log('현재 스크롤 Y 값 저장 = ' + offset);
    $('#scroll_offset').attr('value', offset);
}