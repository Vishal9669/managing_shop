$(document).ready(function() {
  // Get the product and sub-product select fields
  var productSelect = $('#order_product_orders_attributes_0_id');
  var subProductSelect = $('#order_product_orders_attributes_0_sub_product_id');

  // Hide the sub-product select field initially
  subProductSelect.hide();

  // When a product is selected
  productSelect.on('change', function() {

    var productId = $(this).val();

    // Hide the sub-product select field if no product is selected
    if (productId === '') {
      subProductSelect.hide();
      return;
    }

    // Fetch the associated sub-products using AJAX
    $.ajax({
      url: '/products/' + productId + '/selected_subproducts',
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        // Clear the sub-product select options
        subProductSelect.empty();

        // Add the default option
        var defaultOption = $('<option>').text('Select a sub-product');
        subProductSelect.append(defaultOption);

        // Add the fetched sub-products as options
        $.each(data, function(index, subProduct) {
          var option = $('<option>').val(subProduct.id).text(subProduct.company_name);
          subProductSelect.append(option);
        });

        // Show the updated sub-product select field
        subProductSelect.show();
      }
    });
  });
});
