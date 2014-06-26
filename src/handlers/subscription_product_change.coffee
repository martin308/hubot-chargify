module.exports = (speak, payload) ->
  previous_product = payload.previous_product
  new_product = payload.subscription.product

  message = "A customer just migrated from #{previous_product?.name} to #{new_product.name}"

  message_prefix = if parseInt(new_product.price_in_cents) > parseInt(previous_product.price_in_cents) then "Good news everybody!" else "Oh noes!"

  if new_product.price_in_cents is previous_product.price_in_cents
    speak message
  else
    speak "#{message_prefix} #{message}"
