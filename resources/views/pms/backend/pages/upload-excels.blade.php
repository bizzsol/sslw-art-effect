@extends('pms.backend.layouts.master-layout')
@section('title', session()->get('system-information')['name']. ' | '.$title)
@section('main-content')
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="{{ route('pms.dashboard') }}">Home</a>
                </li>
                <li>
                    <a href="#">PMS</a>
                </li>
                <li class="active">{{ $title }}</li>
                <li class="top-nav-btn">
                    <a href="javascript:history.back()" class="btn btn-sm btn-warning text-white" data-toggle="tooltip" title="Back" > <i class="las la-chevron-left"></i>Back</a>
                </li>
            </ul>
        </div>

        <div class="page-content">
            <div class="">
                <div class="panel panel-info">
                    <form  method="post" action="{{ route('pms.upload-excels.store') }}" enctype="multipart/form-data">
                    @csrf
                      <div class="panel-body">
                        <div class="form-group row">
                          <div class="col-md-2 mb-3">
                            <label for="module"><strong>Module :</strong></label>
                            <select class="form-control" name="module" id="module">
                              <option value="employees">Employees</option>
                              <option value="designations">Designations</option>
                              <option value="chart-of-accounts">Chart of Accounts</option>
                              <option value="profit-centres">Profit Centre</option>
                              <option value="cost-centres">Cost Centre</option>
                              <option value="additional-cost-centres">Additional Cost Centre</option>
                              <option value="bank-accounts">Bank Account</option>
                              <option value="product-units">Product Units</option>
                              <option value="products">Products</option>
                              <option value="suppliers">Suppliers</option>
                              <option value="fixed-assets">Fixed Assets</option>
                              <option value="closing-balance">Closing Balance</option>
                              <option value="table-backup">Table Backup</option>
                              <option value="ar">Accounts Receivable</option>
                              <option value="ap">Accounts Payable</option>
                            </select>
                          </div>
                          <div class="col-md-2 mb-3">
                            <label for="company_id"><strong>Company</strong></label>
                            <select class="form-control" name="company_id" id="company_id" onchange="getCostCentres();getChartOfAccounts();">
                              <option value="{{ null }}">N/A</option>
                              @if(isset($companies[0]))
                              @foreach($companies as $company)
                              <option value="{{ $company->id }}">{{ $company->code }}</option>
                              @endforeach
                              @endif
                            </select>
                          </div>
                          <div class="col-md-4 mb-3">
                            <label for="cost_centre_id"><strong>Cost Centre :</strong></label>
                            <select class="form-control" name="cost_centre_id" id="cost_centre_id">
                              <option value="{{ null }}">N/A</option>
                            </select>
                          </div>
                          <div class="col-md-4 mb-3">
                            <label for="asset_cost_ledger_id"><strong>Asset Cost Ledger</strong></label>
                            <select class="form-control" name="asset_cost_ledger_id" id="asset_cost_ledger_id">
                              <option value="{{ null }}">N/A</option>
                            </select>
                          </div>
                          <div class="col-md-4 mb-3">
                            <label for="accumulated_depreciation_ledger_id"><strong>Accumulated Depreciation Ledger</strong></label>
                            <select class="form-control" name="accumulated_depreciation_ledger_id" id="accumulated_depreciation_ledger_id">
                              <option value="{{ null }}">N/A</option>
                            </select>
                          </div>
                          <div class="col-md-4 mb-3">
                            <label for="depreciation_expense_ledger_id"><strong>Depreciation Expense Ledger</strong></label>
                            <select class="form-control" name="depreciation_expense_ledger_id" id="depreciation_expense_ledger_id">
                              <option value="{{ null }}">N/A</option>
                            </select>
                          </div>
                          <div class="col-md-2 mb-3">
                            <label for="excel_file"><strong>Excel File :</strong></label>
                            <input type="file" name="excel_file" id="excel_file" class="form-control">
                          </div>
                          <div class="col-md-2 pt-4">
                            <button type="submit" class="mt-2 btn btn-success rounded btn-block"><i class="la la-check"></i>&nbsp;Upload Excel</button>
                          </div>
                        </div>
                      </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('page-script')
<script type="text/javascript">
    function getCostCentres() {
        $.ajax({
            url: "{{ url('pms/upload-excels') }}?get-cost-centres&company_id="+$('#company_id').val(),
            type: 'GET',
            data: {},
        })
        .done(function(response) {
            $('#cost_centre_id').html(response).change();
        });
    }

    function getChartOfAccounts() {
        $.ajax({
            url: "{{ url('pms/upload-excels') }}?get-coa&company_id="+$('#company_id').val(),
            type: 'GET',
            data: {},
        })
        .done(function(response) {
            $('#asset_cost_ledger_id').html(response).change();
            $('#accumulated_depreciation_ledger_id').html(response).change();
            $('#depreciation_expense_ledger_id').html(response).change();
        });
    }
</script>
@endsection
