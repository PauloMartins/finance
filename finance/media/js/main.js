(function(){

	$("a[data-toggle=popover]").popover().bind('click', function(e) {
		e.preventDefault();
		$item = $(this);
		
		$(this).find('span.value').toggleClass('hide');

		$("a[rel=status]").not('.disabled').bind('click', function(e) {
			e.preventDefault();
			$this = $(this);

			$.getJSON(
				'/product/status/' + $this.data('product-id') + '/' + $this.data('status'),
				function( response ) {
					if ( response.status ) {
						$this.removeClass('btn-info').addClass('btn-success disabled');
						$item.addClass('btn-success');
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