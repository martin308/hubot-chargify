module.exports = (speak, payload) ->
  previous_product = payload.previous_product
  new_product = payload.subscription.product
  message_prefix = if new_product.price_in_cents > previous_product.price_in_cents then "Good news everybody!" else "Oh noes!"
  speak "#{message_prefix} A customer just migrated from #{previous_product?.name} to #{new_product.name}"
