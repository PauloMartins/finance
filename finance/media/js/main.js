(function(){

	$("a[data-toggle=popover]").popover().click(function(e) {
		e.preventDefault()
		$item = $(this)
		
		$("a[rel=status]").not('.disabled').bind('click', function(e) {
			e.preventDefault();
			$this = $(this);

			$.getJSON(
				'/product/status/' + $this.data('product-id') + '/' + $this.data('status'),
				function( response ) {
					if ( response.status ) {
						$this.removeClass('btn-info').addClass('btn-success disabled');
						$item.find('span.pull-left').addClass('success');
					}
				}
			);
		});
	});

	product = function() {
		$('form[name=product]').submit(function(){
			date = $(this).find('input[name=date]').val();
			end_date = $(this).find('input[name=end_date]').val();

			if ( !end_date )
				$(this).find('input[name=end_date]').val( date );
		});
	}

}).call(this);