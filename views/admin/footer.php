<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel1">Invite Employee</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xl-12">
						<label class="form-label">Email ID<span class="text-danger">*</span></label>
						<input type="email" class="form-control" placeholder="hello@gmail.com">
						<label class="form-label mt-3">Employment date<span class="text-danger">*</span></label>
						<input class="form-control" type="date">
						<div class="row">
							<div class="col-xl-6">
								<label class="form-label mt-3">First Name<span class="text-danger">*</span></label>
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Name">
								</div>
							</div>
							<div class="col-xl-6">
								<label class="form-label mt-3">Last Name<span class="text-danger">*</span></label>
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Surname">
								</div>
							</div>
						</div>
						<div class="mt-3 invite">
							<label class="form-label">Send invitation email<span class="text-danger">*</span></label>
							<input type="email" class="form-control " placeholder="+ invite">
						</div>


					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>

<!--**********************************
            Footer start
        ***********************************-->
<div class="footer">
	<div class="copyright">
		<p>Copyright © Developed by <a href="https://www.facebook.com/nguyennhatloc?locale=vi_VN" target="_blank">Nguyễn Nhật Lộc</a> <span class="current-year"><?=date('Y')?></span></p>
	</div>
</div>

</div>
<script src="/assets/admin/vendor/global/global.min.js"></script>
<script src="/assets/admin/vendor/chart.js/Chart.bundle.min.js"></script>
<script src="/assets/admin/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="/assets/admin/vendor/apexchart/apexchart.js"></script>

<!-- Dashboard 1 -->
<script src="/assets/admin/js/dashboard/dashboard-1.js"></script>
<script src="/assets/admin/vendor/draggable/draggable.js"></script>


<!-- tagify -->
<script src="/assets/admin/vendor/tagify/dist/tagify.js"></script>

<script src="/assets/admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assets/admin/vendor/datatables/js/dataTables.buttons.min.js"></script>
<script src="/assets/admin/vendor/datatables/js/buttons.html5.min.js"></script>
<script src="/assets/admin/vendor/datatables/js/jszip.min.js"></script>
<script src="/assets/admin/js/plugins-init/datatables.init.js"></script>

<!-- Apex Chart -->

<script src="/assets/admin/vendor/bootstrap-datetimepicker/js/moment.js"></script>
<script src="/assets/admin/vendor/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

<!-- 
<script src="/assets/admin/vendor/dropzone/dropzone.min.js"></script> -->
<!-- Vectormap -->
<script src="/assets/admin/vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="/assets/admin/vendor/jqvmap/js/jquery.vmap.world.js"></script>
<script src="/assets/admin/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="/assets/admin/js/custom.js"></script>
<script src="/assets/admin/js/deznav-init.js"></script>
<script src="/assets/admin/js/demo.js"></script>
<script src="/assets/admin/js/styleSwitcher.js"></script>
<script src="/assets/admin/js/style.js?v=<?=time()?>"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</body>

</html>