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
                        <button onclick="document.getElementById('importBackupModal').style.display='block'"
                            class="btn btn-sm btn-success text-white" data-toggle="tooltip" title="Import Backup">
                            <i class="las la-upload"></i> Import Backup
                        </button>
                        <button onclick="runQueueWorker()"
                            class="btn btn-sm btn-info text-white" data-toggle="tooltip" title="Process Queue Jobs">
                            <i class="las la-play"></i> Process Queue
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
                                    <input type="radio" name="mode" value="entries_only">
                                    <strong>Entries Only</strong> (only entry data, scoped to a fiscal year)
                                </label>
                            </div>

                            <!-- Fiscal Year selector (only for Entries Only mode) -->
                            <div class="form-group" id="fiscalYearGroup" style="display: none; margin-left: 20px;">
                                <label for="fiscal-year"><strong>Fiscal Year</strong></label>
                                <select name="fiscal_year_id[]" id="fiscal-year" class="form-control">
                                    @foreach($fiscalYears as $fy)
                                        <option value="{{ $fy->id }}">{{ $fy->title }}</option>
                                    @endforeach
                                </select>
                                <p class="help-block">
                                    <i class="las la-info-circle"></i>
                                    Only entries (and related items/logs) for this fiscal year are exported.
                                </p>
                            </div>

                            <div class="radio">
                                <label>
                                    <input type="radio" name="mode" value="logs">
                                    <strong>Logs Only</strong> (transaction_logs & entry_logs data)
                                </label>
                            </div>
                        </div>

                        <div id="backupProgressSection" style="display: none;">
                            <h5 class="text-center" id="progressMessage">Starting...</h5>
                            <div class="progress" style="height: 25px;">
                                <div id="backupProgressBar" class="progress-bar progress-bar-striped active"
                                    role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                                    style="width: 0%;">
                                    0%
                                </div>
                            </div>
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

    <!-- Import Backup Modal -->
    <div id="importBackupModal" class="modal" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="importBackupForm" action="{{ route('pms.backups.import') }}" method="POST"
                    enctype="multipart/form-data">
                    @csrf
                    <div class="modal-header">
                        <button type="button" class="close"
                            onclick="document.getElementById('importBackupModal').style.display='none'">&times;
                        </button>
                        <h4 class="modal-title">
                            <i class="las la-upload"></i> Import Backup (.sql / .sql.gz)
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group" id="importInputGroup">
                            <label for="sql-file"><strong>SQL File</strong></label>
                            <input type="file" name="sql_file" id="sql-file" class="form-control" accept=".sql,.gz">
                            <p class="help-block">
                                <i class="las la-info-circle"></i>
                                Upload an "Entries Only" file to sync a fiscal year, or any backup .sql / .sql.gz file.
                            </p>

                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="ignore_duplicates" value="1" checked>
                                    <strong>Skip duplicate rows</strong> (INSERT IGNORE — recommended for sync)
                                </label>
                            </div>

                            <div class="alert alert-warning">
                                <i class="las la-exclamation-triangle"></i>
                                Import writes directly to the database. Make sure the structure already
                                exists (run an "All Tables" backup/restore first) before syncing entries.
                            </div>
                        </div>

                        <!-- Import Progress Bar (Hidden by default) -->
                        <div id="importProgressSection" style="display: none;">
                            <h5 class="text-center" id="importProgressMessage">Starting import...</h5>
                            <div class="progress" style="height: 25px;">
                                <div id="importProgressBar" class="progress-bar progress-bar-striped active"
                                    role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                                    style="width: 0%;">
                                    0%
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="btnCloseImportModal"
                            onclick="document.getElementById('importBackupModal').style.display='none'">
                            <i class="las la-times"></i> Cancel
                        </button>
                        <button type="submit" class="btn btn-success" id="btnStartImport">
                            <i class="las la-upload"></i> Start Import
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

<!-- Floating Status Banner -->
<div id="backupStatusBanner" class="alert" style="display: none; position: fixed; top: 0; left: 0; right: 0; z-index: 9999; border-radius: 0; margin-bottom: 0; text-align: center;">
    <span id="bannerIcon" class="las la-spinner la-spin" style="font-size: 18px; margin-right: 8px;"></span>
    <span id="bannerMessage"></span>
    <button type="button" class="close" onclick="dismissBanner()" style="position: absolute; right: 15px; top: 10px;">&times;</button>
</div>

@section('page-script')
    <script>
        var backupPollInterval = null;
        var importPollInterval = null;

        // ---------- Toggle Fiscal Year selector ----------
        document.querySelectorAll('input[name="mode"]').forEach(function (radio) {
            radio.addEventListener('change', function () {
                document.getElementById('fiscalYearGroup').style.display =
                    (this.value === 'entries_only' && this.checked) ? 'block' : 'none';
            });
        });

        // ---------- Banner helpers ----------
        function showBanner(type, message, persist) {
            var banner = document.getElementById('backupStatusBanner');
            var icon = document.getElementById('bannerIcon');
            var msg = document.getElementById('bannerMessage');
            banner.className = 'alert alert-' + type;
            banner.style.display = 'block';
            icon.className = type === 'success' ? 'las la-check-circle' : (type === 'danger' ? 'las la-exclamation-circle' : 'las la-spinner la-spin');
            msg.innerText = message;
            if (!persist) {
                setTimeout(function () { banner.style.display = 'none'; }, 5000);
            }
        }

        function dismissBanner() {
            document.getElementById('backupStatusBanner').style.display = 'none';
        }

        // ---------- Browser Notification ----------
        function notifyUser(title, body) {
            if (!('Notification' in window)) return;
            if (Notification.permission === 'granted') {
                new Notification(title, { body: body, icon: '/favicon.ico' });
            } else if (Notification.permission !== 'denied') {
                Notification.requestPermission().then(function (p) {
                    if (p === 'granted') new Notification(title, { body: body, icon: '/favicon.ico' });
                });
            }
        }

        // ---------- Check for active jobs on page load ----------
        function checkActiveJobs() {
            fetch('{{ route("pms.backups.status") }}')
                .then(function (r) { return r.json(); })
                .then(function (status) {
                    if (status.status === 'processing' || status.status === 'started') {
                        showBanner('info', 'Backup in progress: ' + (status.message || 'Working...'), true);
                        startBackgroundBackupPolling();
                    }
                });

            fetch('{{ route("pms.backups.import-status") }}')
                .then(function (r) { return r.json(); })
                .then(function (status) {
                    if (status.status === 'processing' || status.status === 'started') {
                        showBanner('info', 'Import in progress: ' + (status.message || 'Working...'), true);
                        startBackgroundImportPolling();
                    }
                });
        }

        // ---------- Background Backup Polling (runs regardless of modal) ----------
        function startBackgroundBackupPolling() {
            if (backupPollInterval) return;
            backupPollInterval = setInterval(function () {
                fetch('{{ route("pms.backups.status") }}')
                    .then(function (r) { return r.json(); })
                    .then(function (status) {
                        if (status.status === 'processing' || status.status === 'started') {
                            showBanner('info', 'Backup: ' + (status.message || 'Working...'), true);
                        } else if (status.status === 'completed') {
                            clearInterval(backupPollInterval);
                            backupPollInterval = null;
                            showBanner('success', 'Backup completed: ' + status.filename, false);
                            notifyUser('Backup Complete', 'Your database backup "' + status.filename + '" finished successfully.');
                            setTimeout(function () { location.reload(); }, 3000);
                        } else if (status.status === 'error') {
                            clearInterval(backupPollInterval);
                            backupPollInterval = null;
                            showBanner('danger', 'Backup failed: ' + status.message, false);
                            notifyUser('Backup Failed', status.message);
                        }
                    });
            }, 3000);
        }

        // ---------- Background Import Polling ----------
        function startBackgroundImportPolling() {
            if (importPollInterval) return;
            importPollInterval = setInterval(function () {
                fetch('{{ route("pms.backups.import-status") }}')
                    .then(function (r) { return r.json(); })
                    .then(function (status) {
                        if (status.status === 'processing' || status.status === 'started') {
                            showBanner('info', 'Import: ' + (status.message || 'Working...'), true);
                        } else if (status.status === 'completed') {
                            clearInterval(importPollInterval);
                            importPollInterval = null;
                            showBanner('success', 'Import completed: ' + status.filename, false);
                            notifyUser('Import Complete', 'Database import "' + status.filename + '" finished successfully.');
                            setTimeout(function () { location.reload(); }, 3000);
                        } else if (status.status === 'error') {
                            clearInterval(importPollInterval);
                            importPollInterval = null;
                            showBanner('danger', 'Import failed: ' + status.message, false);
                            notifyUser('Import Failed', status.message);
                        }
                    });
            }, 3000);
        }

        // ---------- Handle Backup Form Submission ----------
        document.querySelector('#createBackupModal form').addEventListener('submit', function (e) {
            e.preventDefault();
            var form = this;
            var btnStart = document.getElementById('btnStartBackup');
            var btnClose = document.getElementById('btnCloseModal');
            var inputGroup = document.getElementById('backupInputGroup');
            var progressSection = document.getElementById('backupProgressSection');
            var progressBar = document.getElementById('backupProgressBar');
            var progressMessage = document.getElementById('progressMessage');

            btnStart.disabled = true;
            btnClose.disabled = true;
            inputGroup.style.display = 'none';
            progressSection.style.display = 'block';

            fetch(form.action, {
                method: 'POST',
                body: new FormData(form),
                headers: { 'X-Requested-With': 'XMLHttpRequest' }
            })
                .then(function (r) { return r.json(); })
                .then(function (data) {
                    if (data.status === 'success') {
                        progressMessage.innerText = 'Backup started!';
                        progressBar.style.width = '10%';

                        showBanner('info', 'Backup started in background. You can close this window.', false);

                        // Close modal after short delay
                        setTimeout(function () {
                            document.getElementById('createBackupModal').style.display = 'none';
                            resetModal();
                        }, 1500);

                        startBackgroundBackupPolling();
                    } else {
                        alert('Error: ' + data.message);
                        resetModal();
                    }
                })
                .catch(function () {
                    startBackgroundBackupPolling();
                    setTimeout(function () {
                        document.getElementById('createBackupModal').style.display = 'none';
                        resetModal();
                    }, 1500);
                });

            function resetModal() {
                btnStart.disabled = false;
                btnClose.disabled = false;
                inputGroup.style.display = 'block';
                progressSection.style.display = 'none';
                progressBar.style.width = '0%';
            }
        });

        // ---------- Handle Import Form Submission ----------
        document.getElementById('importBackupForm').addEventListener('submit', function (e) {
            e.preventDefault();
            var form = this;
            var fileInput = document.getElementById('sql-file');
            var btnStart = document.getElementById('btnStartImport');
            var btnClose = document.getElementById('btnCloseImportModal');
            var inputGroup = document.getElementById('importInputGroup');
            var progressSection = document.getElementById('importProgressSection');
            var progressBar = document.getElementById('importProgressBar');
            var progressMessage = document.getElementById('importProgressMessage');

            if (!fileInput.files.length) {
                alert('Please choose a .sql file to import.');
                return;
            }

            btnStart.disabled = true;
            btnClose.disabled = true;
            inputGroup.style.display = 'none';
            progressSection.style.display = 'block';

            fetch(form.action, {
                method: 'POST',
                body: new FormData(form),
                headers: { 'X-Requested-With': 'XMLHttpRequest' }
            })
                .then(function (r) { return r.json(); })
                .then(function (data) {
                    if (data.status === 'success') {
                        progressMessage.innerText = 'Import started!';
                        progressBar.style.width = '10%';

                        showBanner('info', 'Import started in background. You can close this window.', false);

                        setTimeout(function () {
                            document.getElementById('importBackupModal').style.display = 'none';
                            resetImportModal();
                        }, 1500);

                        startBackgroundImportPolling();
                    } else {
                        alert('Error: ' + data.message);
                        resetImportModal();
                    }
                })
                .catch(function () {
                    startBackgroundImportPolling();
                    setTimeout(function () {
                        document.getElementById('importBackupModal').style.display = 'none';
                        resetImportModal();
                    }, 1500);
                });

            function resetImportModal() {
                btnStart.disabled = false;
                btnClose.disabled = false;
                inputGroup.style.display = 'block';
                progressSection.style.display = 'none';
                progressBar.style.width = '0%';
            }
        });

        // ---------- Deletion helpers ----------
        function deleteBackup(filename) {
            if (confirm('Are you sure you want to delete this backup?')) {
                var form = document.getElementById('deleteForm');
                form.action = '{{ route("pms.backups.destroy", "") }}/' + filename;
                form.submit();
            }
        }

        function toggleAll(checkbox) {
            document.querySelectorAll('.backup-checkbox').forEach(function (cb) { cb.checked = checkbox.checked; });
        }

        function selectAll() {
            document.querySelectorAll('.backup-checkbox').forEach(function (cb) { cb.checked = true; });
            document.getElementById('selectAllCheckbox').checked = true;
        }

        function deselectAll() {
            document.querySelectorAll('.backup-checkbox').forEach(function (cb) { cb.checked = false; });
            document.getElementById('selectAllCheckbox').checked = false;
        }

        function deleteSelected() {
            var checkboxes = document.querySelectorAll('.backup-checkbox:checked');
            if (checkboxes.length === 0) { alert('Please select at least one backup to delete.'); return; }
            if (confirm('Are you sure you want to delete ' + checkboxes.length + ' backup(s)?')) {
                var form = document.getElementById('deleteMultipleForm');
                var container = document.getElementById('selectedBackupsContainer');
                container.innerHTML = '';
                checkboxes.forEach(function (cb) {
                    var input = document.createElement('input');
                    input.type = 'hidden'; input.name = 'backups[]'; input.value = cb.value;
                    container.appendChild(input);
                });
                form.submit();
            }
        }

        // Close modal when clicking outside
        window.onclick = function (event) {
            var createModal = document.getElementById('createBackupModal');
            if (event.target == createModal) {
                if (document.getElementById('backupProgressSection').style.display === 'none') {
                    createModal.style.display = 'none';
                }
            }
            var importModal = document.getElementById('importBackupModal');
            if (event.target == importModal) {
                if (document.getElementById('importProgressSection').style.display === 'none') {
                    importModal.style.display = 'none';
                }
            }
        };

        // Check for active jobs on page load
        document.addEventListener('DOMContentLoaded', checkActiveJobs);

        // Run queue worker
        function runQueueWorker() {
            var btn = event.target;
            btn.disabled = true;
            btn.innerHTML = '<i class="las la-spinner la-spin"></i> Starting...';
            fetch('{{ route("pms.run-queue-worker") }}')
                .then(function(r) { return r.json(); })
                .then(function(data) {
                    if (data.status === 'success') {
                        showBanner('success', data.message, false);
                    } else {
                        showBanner('danger', data.message, false);
                    }
                })
                .catch(function() {
                    showBanner('danger', 'Failed to start queue worker.', false);
                })
                .finally(function() {
                    btn.disabled = false;
                    btn.innerHTML = '<i class="las la-play"></i> Process Queue';
                });
        }
    </script>
@endsection