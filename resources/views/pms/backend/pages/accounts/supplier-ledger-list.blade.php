@extends('pms.backend.layouts.master-layout')
@section('title', session()->get('system-information')['name']. ' | '.$title)
@section('page-css')
<style type="text/css">
	.list-unstyled .ratings {
		display: none;
	}
</style>
@include('yajra.css')
@endsection
@section('main-content')

<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="ace-icon fa fa-home home-icon"></i>
					<a href="{{  route('pms.dashboard') }}">{{ __('Home') }}</a>
				</li>
				<li>
					<a href="#">PMS</a>
				</li>
				<li>
					<a href="#">Accounts</a>
				</li>
				<li class="active">{{__($title)}}</li>
				<li class="top-nav-btn">
				</li>
			</ul>
		</div>

		<div class="page-content">
			<div class="">
				<div class="panel panel-info">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12 mb-4">
								<form action="{{ url('pms/accounts/supplier-ledgers') }}" method="get" accept-charset="utf-8">
									<div class="row">
										<div class="col-md-2 col-sm-6">
											<p class="mb-1 font-weight-bold"><label for="from_date">{{ __('From Date') }}:</label></p>
											<div class="input-group input-group-md mb-3 d-">
												<input type="date" name="from_date" id="from_date" class="form-control rounded" aria-label="Large" aria-describedby="inputGroup-sizing-sm" required value="{{ $from_date }}">
											</div>
										</div>
										<div class="col-md-2 col-sm-6">
											<p class="mb-1 font-weight-bold"><label for="to_date">{{ __('To Date') }}:</label></p>
											<div class="input-group input-group-md mb-3 d-">
												<input type="date" name="to_date" id="to_date" class="form-control rounded" aria-label="Large" aria-describedby="inputGroup-sizing-sm" required value="{{ $to_date }}">
											</div>
										</div>

										<div class="col-md-3 col-sm-6">
											<p class="mb-1 font-weight-bold"><label for="supplier_id">{{ __('Supplier') }}:</label></p>
											<div class="input-group input-group-md mb-3 d-">
												<select name="supplier_id" id="supplier_id" class="form-control rounded">
													<option value="{{ null }}">{{ __('Select One') }}</option>
													@if(isset($chooseSuppliers[0]))
													@foreach($chooseSuppliers as $key => $supplier)
													<option value="{{ $supplier->id }}" {{ $supplier_id == $supplier->id ? 'selected' : '' }}>{{ $supplier->name }} ({{ $supplier->code }})</option>
													@endforeach
													@endif
												</select>
											</div>
										</div>

										<div class="col-md-2 col-sm-6">
											<p class="mb-1 font-weight-bold"><label for="searchRequisitonBtn"></label></p>
											<div class="input-group input-group-md">
												<button class="btn btn-success rounded mt-8"><i class="las la-search"></i>Search</button>
											</div>
										</div>
									</div>
								</form>
							</div>
							
							@if(isset($selected_supplier->name))
							<div class="col-md-12 mb-4">
								<h4 class="text-center">
									Ledger of <strong>{{ $selected_supplier->name  }}</strong>
									&nbsp;&nbsp;|&nbsp;&nbsp;
									<strong>{{ date('F jS Y', strtotime($from_date)) }}</strong> to <strong>{{ date('F jS Y', strtotime($to_date)) }}</strong>
								</h4>
								<hr>
							</div>

							<div class="col-md-12 mb-4">
								@include('yajra.datatable', [
									'title' => 'Ledger of '.$selected_supplier->name.'   |   '.date('F jS Y', strtotime($from_date)).' to '.date('F jS Y', strtotime($to_date))
								])
							</div>
							@endif
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	@endsection
	@section('page-script')
	@include('yajra.js')
	
	@endsection