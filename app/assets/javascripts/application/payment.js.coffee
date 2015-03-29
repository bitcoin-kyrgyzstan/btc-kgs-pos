showQRCode = ->
  qrcodeEl = $("#qrcode")
  new QRCode(qrcodeEl[0], qrcodeEl.data('text'))

trackPaymentStatus = ->
  pageEl = $("#payment_status_page")

  setTimeout (-> pageEl.addClass("pending")), 500
  setTimeout (-> pageEl.removeClass("pending").addClass("valid_transaction_detected")), 4000
  setTimeout (-> pageEl.removeClass("valid_transaction_detected").addClass("verified")), 8000
  setTimeout (-> pageEl.removeClass("verified").addClass("invalid")), 10000


jQuery ->
  if $("#payment_status_page").length > 0
    showQRCode()
    trackPaymentStatus()