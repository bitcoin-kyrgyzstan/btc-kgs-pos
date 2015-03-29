showQRCode = ->
  qrcodeEl = $("#qrcode")
  new QRCode(qrcodeEl[0], qrcodeEl.data('text'))

jQuery ->
  if $("#payment_status_page").length > 0
    showQRCode()