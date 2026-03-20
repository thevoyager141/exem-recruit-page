document.addEventListener('DOMContentLoaded', function () {
  var buttons = document.querySelectorAll('.btn-coffee');
  buttons.forEach(function (btn) {
    btn.addEventListener('click', function () {
      var name = btn.getAttribute('data-name') || '담당자';
      alert(name + '님과의 커피챗이 신청되었습니다! ☕\n담당자가 확인 후 연락드리겠습니다.');
    });
  });
});
