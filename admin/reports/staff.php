<?php
session_start();
$currentDateTime = date('Y-m-d H:i:s');
$currentUser = 'sgpriyom';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Reports</title>
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../assets/css/custom.css" rel="stylesheet">
</head>
<body>
    <!-- Header Info -->
    <div class="header-info">
        <div class="container">
Current Date and Time (UTC - YYYY-MM-DD HH:MM:SS formatted): <span id="current-datetime"><?php echo $currentDateTime; ?></span>
Current User's Login: <span id="current-user"><?php echo $currentUser; ?></span>
create following: ├── reports/
│   │   ├── staff.php
│   │   ├── bank.php
│   │   ├── lapu.php</div>
    </div>

    <!-- Staff Report Content -->
    <div class="container mt-4">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Staff Performance Report</h4>
                <div>
                    <button class="btn btn-success me-2" onclick="exportTableToExcel('staffTable', 'staff_report.xlsx')">
                        <i class="bi bi-file-excel"></i> Export Excel
                    </button>
                    <button class="btn btn-info" onclick="printElement('reportContent')">
                        <i class="bi bi-printer"></i> Print Report
                    </button>
                </div>
            </div>
            <div class="card-body" id="reportContent">
                <!-- Filters -->
                <div class="row mb-3 filter-section">
                    <div class="col-md-3">
                        <label class="form-label">Date Range</label>
                        <select class="form-select">
                            <option>Today</option>
                            <option>This Week</option>
                            <option selected>This Month</option>
                            <option>Custom Range</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Department</label>
                        <select class="form-select">
                            <option>All Departments</option>
                            <option>Sales</option>
                            <option>Operations</option>
                            <option>Support</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Performance Metric</label>
                        <select class="form-select">
                            <option>Transaction Volume</option>
                            <option>Success Rate</option>
                            <option>Customer Satisfaction</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">&nbsp;</label>
                        <button class="btn btn-primary d-block w-100">Generate Report</button>
                    </div>
                </div>

                <!-- Performance Summary -->
                <div class="row mb-4">
                    <div class="col-md-3">
                        <div class="stats-card">
                            <h6>Total Staff</h6>
                            <h3>124</h3>
                            <small class="text-muted">Active employees</small>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <h6>Average Performance</h6>
                            <h3>87.5%</h3>
                            <small class="text-success">↑ 2.3% vs last month</small>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <h6>Top Performers</h6>
                            <h3>23</h3>
                            <small class="text-muted">>90% rating</small>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <h6>Training Needed</h6>
                            <h3>12</h3>
                            <small class="text-warning"><70% rating</small>
                        </div>
                    </div>
                </div>

                <!-- Performance Chart -->
                <div class="chart-container mb-4">
                    <canvas id="performanceChart"></canvas>
                </div>

                <!-- Staff Table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="staffTable">
                        <thead>
                            <tr>
                                <th>Employee ID</th>
                                <th>Name</th>
                                <th>Department</th>
                                <th>Transactions</th>
                                <th>Success Rate</th>
                                <th>Customer Rating</th>
                                <th>Performance Score</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>EMP001</td>
                                <td>John Doe</td>
                                <td>Sales</td>
                                <td>245</td>
                                <td>95.2%</td>
                                <td>4.8/5</td>
                                <td>92%</td>
                                <td><span class="badge bg-success">Excellent</span></td>
                            </tr>
                            <tr>
                                <td>EMP002</td>
                                <td>Jane Smith</td>
                                <td>Operations</td>
                                <td>198</td>
                                <td>88.7%</td>
                                <td>4.5/5</td>
                                <td>85%</td>
                                <td><span class="badge bg-primary">Good</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <nav class="mt-3">
                    <ul class="pagination justify-content-end">
                        <li class="page-item disabled">
                            <a class="page-link" href="#">Previous</a>
                        </li>
                        <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="../../assets/js/jquery.min.js"></script>
    <script src="../../assets/js/bootstrap.bundle.min.js"></script>
    <script src="../../assets/js/custom.js"></script>
</body>
</html>