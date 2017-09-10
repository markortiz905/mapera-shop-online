<%@ include file="../../common/header.jspf" %>
<body>

	<%@ include file="../../common/nav.jspf" %>
	
	<div class="container">
		Your New Catalog Item:
		<form id="addForm" class="">
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Catalog ID</label> <input name="id" type="text"
							class="form-control" value="${givenId}" /> <BR />
					</fieldset>
				</div>
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Catalog SKU</label> <input name="sku" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Title</label> <input name="title" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Quantity Available</label> <input name="quantityAvailable" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Cost</label> <input name="cost" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Product</label> <input name="product" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Category</label> <input name="category" type="text"
							class="form-control"    /> <BR />
					</fieldset>
				</div>
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Description</label> <input name="description" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Brand</label> <input name="brand" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Minimum advertised price</label> <input name="map" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Manufacturers suggested retail price</label> <input name="msrp" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Manufacturer part number</label> <input name="mpn" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Universal product code</label> <input name="upc" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>length</label> <input name="length" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Width</label> <input name="width" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Height</label> <input name="height" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Weight</label> <input name="weight" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Handling Cost</label> <input name="handlingCost" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>Product Attributes</label> <input name="productAttributes" type="text"
							class="form-control"  /> <BR />
					</fieldset>
				</div>
				<div class="col">
					<fieldset class="form-group col-md-6">
						<label>TODO: Immages</label> 
					</fieldset>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<fieldset class="form-group col-md-6">
						<input name="add" type="submit" class="btn btn-success" value="Submit" />
					</fieldset>
				</div>
			</div>
		</form>
	</div>

	<%@ include file="../../common/footer.jspf" %>
<script type="text/javascript">
	function objectiFy(form) {
		var object={};
		$.each($("#" + form).serializeArray(), 
		function (i,o){
			object[o.name] = o.value;
		});
		return object
	}
	
	$( "#addForm" ).submit(function( event ) {
	  event.preventDefault();
	  $.ajax({
		    url: "${pageContext.request.contextPath}/catalog/catalogSave",
		    type: 'POST',
		    contentType: "application/json",
		    data : JSON.stringify( objectiFy("addForm") ),
		    success: function(data, textStatus, request) {
		       window.location = request.getResponseHeader('Location');
		    },
		    error : function(jqXHR, textStatus, errorThrown) {
		    	//alert(textStatus);
		    	$("#errorMessage").html("Failed to create Catalog : " + textStatus);
		    }
		});
		 return false;
	});
</script>
</body>

</html>