<%@ include file="../../common/header.jspf" %>
<body>

	<%@ include file="../../common/nav.jspf" %>

	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-5" >
				<div id="myCarousel" class="carousel slide col-md-6" data-ride="carousel">
				 <!-- Indicators -->
				 <ol class="carousel-indicators">
				   <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				   <li data-target="#myCarousel" data-slide-to="1"></li>
				   <li data-target="#myCarousel" data-slide-to="2"></li>
				 </ol>
				
				 <!-- Wrapper for slides -->
				 <div class="carousel-inner">
				 	<c:forEach items="${catalog.images}" var="img" varStatus = "status">
				 		<div class="item ${status.first ? 'active' : ''}">
					     <img src="${img}" alt="${catalog.title}">
					   </div>
					</c:forEach>
				 </div>
				
				 <!-- Left and right controls -->
				  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#myCarousel" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			</div>
			<div class="col-md-4">
				<dl class="dl-horizontal">
					<dt>
						<label>Catalog ID : </label>
					</dt>
					<dd >
						${catalog.id}
					</dd >
					<dt>
						<label>SKU : </label>
					</dt>
					<dd>
						${catalog.sku}
					</dd>
					
					<dt>
						<label>Title : </label>
					</dt>
					<dd>
						${catalog.title}
					</dd>
					<dt>
						<label>Quantity Available : </label>
					</dt>
					<dd>
						${catalog.quantityAvailable}
					</dd>
				
					<dt>
						<label>Cost : </label>
					</dt>
					<dd>
						${catalog.cost}
					</dd>
					<dt>
						<label>Product : </label>
					</dt>
					<dd>
						${catalog.product}
					</dd>
				
					<dt>
						<label>Category : </label>
					</dt>
					<dd>
						${catalog.category}
					</dd>
					<dt>
						<label>Description : </label>
					</dt>
					<dd>
						${catalog.description}
					</dd>
				
					<dt>
						<label>Brand : </label>
					</dt>
					<dd>
						${catalog.brand}
					</dd>
					<dt>
		<!-- 			Minimum advertised price -->
						<label>(MAP) : </label>
					</dt>
					<dd>
						${catalog.map}
					</dd>
				
					<dt>
		<!-- 				Manufacturer's suggested retail price -->
						<label>(MSRP) : </label>
					</dt>
					<dd>
						${catalog.msrp}
					</dd>
					<dt>
		<!-- 			Manufacturer part number -->
						<label>(MPN) : </label>
					</dt>
					<dd>
						${catalog.mpn}
					</dd>
				
					<dt>
		<!-- 			Universal product code -->
						<label>(UPC) : </label>
					</dt>
					<dd>
						${catalog.upc}
					</dd>
					<dt>
						<label>Length : </label>
					</dt>
					<dd>
						${catalog.length}
					</dd>
				
					<dt>
						<label>Width : </label>
					</dt>
					<dd>
						${catalog.width}
					</dd>
					<dt>
						<label>Height : </label>
					</dt>
					<dd>
						${catalog.height}
					</dd>
				
					<dt>
						<label>Product Attributes : </label>
					</dt>
					<dd>
						${catalog.productAttributes}
					</dd>
					<dt>
					</dt>
					<dd>
					</dd>
				</dl>
			</div>
		</div>
	</div>

	<%@ include file="../../common/footer.jspf" %>

</body>

</html>