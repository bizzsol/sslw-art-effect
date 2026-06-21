@extends('pms.backend.layouts.master-layout')
@section('title', session()->get('system-information')['name'] . ' | ' . $title)
@section('page-css')
    @include('yajra.css')
@endsection

@section('main-content')
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li>
                        <a href="#">CORE</a>
                    </li>
                    <li class="active">{{__($title)}} List</li>
                    <li class="top-nav-btn">
                        <button onclick="document.getElementById('createBackupModal').style.display='block'"
                            class="btn btn-sm btn-primary text-white" data-toggle="tooltip" title="Create New Backup">
                            <i class="las la-plus"></i> Create New Backup
                        </button>
                    </li>

                </ul>
            </div>

            <div class="page-content">
                <div class="">
                    <!-- Success/Error Messages -->
                    @if(session('success'))
                        <div class="alert alert-success alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <i class="icon fa fa-check"></i> {{ session('success') }}
                        </div>
                    @endif

                    @if(session('error'))
                        <div class="alert alert-danger alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <i class="icon fa fa-ban"></i> {{ session('error') }}
                        </div>
                    @endif

                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class="las la-database"></i> Database Backups
                            </h3>
                        </div>
                        <div class="panel-body">
                            @if($backups->count() > 0)
                                <!-- Bulk Actions -->
                                <div class="mb-3 clearfix">
                                    <div class="pull-left">
                                        <button onclick="selectAll()" class="btn btn-xs btn-info">
                                            <i class="las la-check-square"></i> Select All
                                        </button>
                                        <button onclick="deselectAll()" class="btn btn-xs btn-default">
                                            <i class="lar la-square"></i> Deselect All
                                        </button>
                                    </div>
                                    <div class="pull-right">
                                        <button onclick="deleteSelected()" class="btn btn-xs btn-danger">
                                            <i class="las la-trash"></i> Delete Selected
                                        </button>
                                    </div>
                                </div>

                                <!-- Backups Table -->
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th width="50">
                                                    <input type="checkbox" id="selectAllCheckbox" onclick="toggleAll(this)">
                                                </th>
                                                <th><i class="las la-file"></i> Filename</th>
                                                <th width="120"><i class="las la-hdd"></i> Size</th>
                                                <th width="180"><i class="las la-calendar"></i> Created Date</th>
                                                <th width="200" class="text-center"><i class="las la-cog"></i> Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($backups as $backup)
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" class="backup-checkbox"
                                                            value="{{ $backup['name'] }}">
                                                    </td>
                                                    <td>
                                                        <i class="las la-file-archive text-primary"></i>
                                                        <strong>{{ $backup['name'] }}</strong>
                                                    </td>
                                                    <td>
                                                        <span class="label label-info">{{ $backup['size'] }}</span>
                                                    </td>
                                                    <td>
                                                        <i class="las la-clock"></i> {{ $backup['date'] }}
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="{{ route('pms.backups.download', $backup['name']) }}"
                                                            class="btn btn-xs btn-success" data-toggle="tooltip" title="Download">
                                                            <i class="las la-download"></i> Download
                                                        </a>
                                                        <button onclick="deleteBackup('{{ $backup['name'] }}')"
                                                            class="btn btn-xs btn-danger" data-toggle="tooltip" title="Delete">
                                                            <i class="las la-trash"></i> Delete
                                                        </button>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>

                                <!-- Total Backups Info -->
                                <div class="alert alert-info mt-3">
                                    <i class="las la-info-circle"></i>
                                    <strong>Total Backups:</strong> {{ $backups->count() }} |
                                    <strong>Total
                                        Size:</strong>
                                    {{ $backups->sum('size_bytes') > 0 ? number_format($backups->sum('size_bytes') / 1024 / 1024, 2) . ' MB' : '0 MB' }}
                                </div>
                            @else
                                <div class="text-center py-5">
                                    <i class="las la-database" style="font-size: 64px; color: #ccc;"></i>
                                    <h4 class="text-muted">No backups found</h4>
                                    <p class="text-muted">Get started by creating a new backup.</p>
                                    <button onclick="document.getElementById('createBackupModal').style.display='block'"
                                        class="btn btn-primary mt-2">
                                        <i class="las la-plus"></i> Create First Backup
                                    </button>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Create Backup Modal -->
    <div id="createBackupModal" class="modal" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="{{ route('pms.backups.create') }}" method="POST">
                    @csrf
                    <div class="modal-header">
                        <button type="button" class="close"
                            onclick="document.getElementById('createBackupModal').style.display='none'">&times;
                        </button>
                        <h4 class="modal-title">
                            <i class="las la-database"></i> Create Database Backup
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group" id="backupInputGroup">
                            <label for="backup-name">
                                <strong>Backup Name (Optional)</strong>
                            </label>
                            <input type="text" name="name" id="backup-name" class="form-control"
                                placeholder="e.g., before-update">
                            <p class="help-block">
                                <i class="las la-info-circle"></i>
                                Leave empty to use default naming (database_timestamp.sql)
                            </p>

                            <hr>

                            <label><strong>Backup Type</strong></label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="mode" value="full" checked>
                                    <strong>Full Backup</strong> (All tables, skip log data)
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="mode" value="without_entries">
                                    <strong>All Tables</strong> (All tables without entiries & transection log)
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="mode" value="logs">
                                    <strong>Logs Only</strong> (transaction_logs & entry_logs data)
                                </label>
                            </div>
                        </div>

                        <!-- Progress Bar Section (Hidden by default) -->
                        <div id="backupProgressSection" style="display: none;">
                            <h5 class="text-center" id="progressMessage">Starting backup...</h5>
                            <div class="progress" style="height: 25px;">
                                <div id="backupProgressBar" class="progress-bar progress-bar-striped active"
                                    role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                                    style="width: 0%;">
                                    0%
                                </div>
                            </div>
                            <p class="text-center text-muted small">Please do not close this window.</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="btnCloseModal"
                            onclick="document.getElementById('createBackupModal').style.display='none'">
                            <i class="las la-times"></i> Cancel
                        </button>
                        <button type="submit" class="btn btn-primary" id="btnStartBackup">
                            <i class="las la-check"></i> Create Backup
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Delete Form (Hidden) -->
    <form id="deleteForm" method="POST" style="display: none;">
        @csrf
        @method('DELETE')
    </form>

    <!-- Delete Multiple Form (Hidden) -->
    <form id="deleteMultipleForm" action="{{ route('pms.backups.destroy-multiple') }}" method="POST" style="display: none;">
        @csrf
        <div id="selectedBackupsContainer"></div>
    </form>

@endsection
@section('page-script')
    <script>
        // Handle Backup Form Submission
        document.querySelector('#createBackupModal form').addEventListener('submit', function (e) {
            e.preventDefault();

            const form = this;
            const btnStart = document.getElementById('btnStartBackup');
            const btnClose = document.getElementById('btnCloseModal');
            const inputGroup = document.getElementById('backupInputGroup');
            const progressSection = document.getElementById('backupProgressSection');
            const progressBar = document.getElementById('backupProgressBar');
            const progressMessage = document.getElementById('progressMessage');

            // UI State: Running
            btnStart.disabled = true;
            btnClose.disabled = true;
            inputGroup.style.display = 'none';
            progressSection.style.display = 'block';

            // Start Backup Process
            fetch(form.action, {
                method: 'POST',
                body: new FormData(form),
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
                .then(response => response.json())
                .then(data => {
                    if (data.status === 'success') {
                        // Start Polling
                        startPolling();
                    } else {
                        alert('Error: ' + data.message);
                        resetModal();
                    }
                })
                .catch(error => {
                    // If it's not JSON (redirect or error), check response or alert
                    console.error(error);
                    // Fallback polling just in case it started
                    startPolling();
                });

            function startPolling() {
                const pollInterval = setInterval(() => {
                    fetch('{{ route("pms.backups.status") }}')
                        .then(res => res.json())
                        .then(status => {
                            // Update Progress
                            const percent = status.percent || 0;
                            progressBar.style.width = percent + '%';
                            progressBar.innerText = percent + '%';

                            if (status.message) {
                                progressMessage.innerText = status.message;
                            }

                            if (status.status === 'completed') {
                                clearInterval(pollInterval);
                                progressBar.classList.remove('active');
                                progressBar.classList.add('progress-bar-success');
                                progressMessage.innerText = 'Backup Complete! Reloading...';
                                setTimeout(() => {
                                    window.location.reload();
                                }, 1000);
                            } else if (status.status === 'error') {
                                clearInterval(pollInterval);
                                alert('Backup Failed: ' + status.message);
                                resetModal();
                            }
                        })
                        .catch(err => {
                            console.error('Polling error', err);
                        });
                }, 2000);
            }

            function resetModal() {
                btnStart.disabled = false;
                btnClose.disabled = false;
                inputGroup.style.display = 'block';
                progressSection.style.display = 'none';
                progressBar.style.width = '0%';
            }
        });

        function deleteBackup(filename) {
            if (confirm('Are you sure you want to delete this backup?')) {
                const form = document.getElementById('deleteForm');
                form.action = '{{ route("pms.backups.destroy", "") }}/' + filename;
                form.submit();
            }
        }

        function toggleAll(checkbox) {
            const checkboxes = document.querySelectorAll('.backup-checkbox');
            checkboxes.forEach(cb => cb.checked = checkbox.checked);
        }

        function selectAll() {
            const checkboxes = document.querySelectorAll('.backup-checkbox');
            checkboxes.forEach(cb => cb.checked = true);
            document.getElementById('selectAllCheckbox').checked = true;
        }

        function deselectAll() {
            const checkboxes = document.querySelectorAll('.backup-checkbox');
            checkboxes.forEach(cb => cb.checked = false);
            document.getElementById('selectAllCheckbox').checked = false;
        }

        function deleteSelected() {
            const checkboxes = document.querySelectorAll('.backup-checkbox:checked');

            if (checkboxes.length === 0) {
                alert('Please select at least one backup to delete.');
                return;
            }

            if (confirm(`Are you sure you want to delete ${checkboxes.length} backup(s)?`)) {
                const form = document.getElementById('deleteMultipleForm');
                const container = document.getElementById('selectedBackupsContainer');
                container.innerHTML = '';

                checkboxes.forEach(checkbox => {
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'backups[]';
                    input.value = checkbox.value;
                    container.appendChild(input);
                });

                form.submit();
            }
        }

        // Close modal when clicking outside
        window.onclick = function (event) {
            const modal = document.getElementById('createBackupModal');
            if (event.target == modal) {
                // Only close if not running
                if (document.getElementById('backupProgressSection').style.display === 'none') {
                    modal.style.display = 'none';
                }
            }
        }
    </script>
@endsection