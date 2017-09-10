<%@ include file="../../common/header.jspf" %>
<body>

	<%@ include file="../../common/nav.jspf" %>

	<div class="container">
		<H1>Welcome ${name}</H1>
		<div class="table-responsive">
			<p id="errorMessage"></p>
			<a class="btn btn-default" href="catalog/catalogAdd">Add Catalog</a>
			<table class="table table-bordered table-responsive">
				<caption>Your Catalog's are</caption>
				<thead>
					<th>Catalog ID</th>
					<th>SKU</th>
					
					<th>Title</th>
					<th>Quantity Available</th>
					
					<th>Cost</th>
					<th>Productt</th>
					<th>Category</th>
					<th>Description</th>
					<th>Brand</th>
					<th>MAP</th>
					<th>MSRP</th>
					<th>UPC</th>
					<th>Length</th>
					<th>Width</th>
					<th>Height</th>
					<th>Weight</th>
					<th>Handling Cost</th>
					<th>Product Attributes</th>
					<th>Product Images</th>
					<th colspan="2">Action</th>
				</thead>
				<tbody>
					<c:forEach items="${catalogList}" var="catalog">
						<tr id="${catalog.id}">
							<td>${catalog.id}</td>
							<td>${catalog.sku}</td>
							
							<td>${catalog.title}</td>
							<td>${catalog.quantityAvailable}</td>
							
							<td>${catalog.cost}</td>
							<td>${catalog.product}</td>
							
							<td>${catalog.category}</td>
							<td>${catalog.description}</td>
							
							<td>${catalog.brand}</td>
							<td>${catalog.map}</td>
							
							<td>${catalog.msrp}</td>
							<td>${catalog.upc}</td>
							
							<td>${catalog.length}</td>
							
							<td>${catalog.width}</td>
							<td>${catalog.height}</td>
							
							<td>${catalog.weight}</td>
							<td>${catalog.handlingCost}</td>
							
							<td>${catalog.productAttributes}</td>
							<td class="table">
								<c:forEach items="${catalog.images}" var="img">
									<img src="${img}" alt="${img}" width="82" height="82">
								</c:forEach>
							</td>
							<td>&nbsp;&nbsp;<a class="btn btn-default" href="${pageContext.request.contextPath}/catalog/${catalog.id}">View</a></td>
							<td>&nbsp;&nbsp;<a class="btn btn-danger" onclick="deleteCatalog(${catalog.id})">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<%@ include file="../../common/footer.jspf" %>
	
	<script type="text/javascript">
		function deleteCatalog(catalogId) {
			con = confirm("Are you sure to delete Catalog : " + catalogId + "?");
			if (con) {
				$.ajax({
				    url: '${pageContext.request.contextPath}/catalog/' + catalogId,
				    type: 'DELETE',
				    success: function(result) {
				        $("#" + catalogId).remove();
				    },
				    error : function(jqXHR, textStatus, errorThrown) {
				    	//alert("Invoice " + invoiceNumber + " failed to delete.\n" + errorThrown);
				    }
				});
			}
		}
	</script>
</body>

</html>