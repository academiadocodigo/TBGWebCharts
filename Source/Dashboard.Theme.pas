unit Dashboard.Theme;

interface

type
  TDashboardTheme = class
  public
    class function CSS: string; static;
  end;

implementation

class function TDashboardTheme.CSS: string;
begin
  Result :=
    '<style type="text/css">' +
    '.bgdash{font-family:Segoe UI,Arial,sans-serif;color:#263238;}' +
    '.bgdash *{box-sizing:border-box;}' +
    '.bgdash-row{display:flex;flex-wrap:wrap;margin-left:-6px;margin-right:-6px;}' +
    '.bgdash-col{padding:6px;min-width:0;position:relative;width:100%;}' +
    '.bgdash-col-1{flex:0 0 8.333333%;max-width:8.333333%;}' +
    '.bgdash-col-2{flex:0 0 16.666667%;max-width:16.666667%;}' +
    '.bgdash-col-3{flex:0 0 25%;max-width:25%;}' +
    '.bgdash-col-4{flex:0 0 33.333333%;max-width:33.333333%;}' +
    '.bgdash-col-5{flex:0 0 41.666667%;max-width:41.666667%;}' +
    '.bgdash-col-6{flex:0 0 50%;max-width:50%;}' +
    '.bgdash-col-7{flex:0 0 58.333333%;max-width:58.333333%;}' +
    '.bgdash-col-8{flex:0 0 66.666667%;max-width:66.666667%;}' +
    '.bgdash-col-9{flex:0 0 75%;max-width:75%;}' +
    '.bgdash-col-10{flex:0 0 83.333333%;max-width:83.333333%;}' +
    '.bgdash-col-11{flex:0 0 91.666667%;max-width:91.666667%;}' +
    '.bgdash-col-12{flex:0 0 100%;max-width:100%;}' +
    '.bgdash-panel,.bgdash-kpi{background:#fff;border:1px solid #e4e9ef;border-radius:8px;box-shadow:0 1px 3px rgba(0,0,0,.06);}' +
    '.bgdash-panel{margin-bottom:12px;overflow:hidden;}.bgdash-panel-title{display:flex;align-items:center;justify-content:space-between;gap:10px;font-size:14px;font-weight:600;padding:12px 14px;' +
    'border-bottom:1px solid #edf0f3;}.bgdash-panel-title-text{min-width:0;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.bgdash-panel-action{margin-left:auto;font-size:12px;font-weight:600;' +
    'color:#337ab7;text-decoration:none;white-space:nowrap}.bgdash-panel-action:hover{color:#245d8f;text-decoration:underline}' +
    '.bgdash-panel-body{padding:14px;}.bgdash-kpi{padding:14px;min-height:108px;position:relative;overflow:hidden;}' +
    '.bgdash-kpi-title{font-size:12px;color:#667681;text-transform:uppercase;letter-spacing:.3px;}' +
    '.bgdash-kpi-value{font-size:26px;font-weight:700;line-height:34px;margin-top:4px;color:#1d2b36;}' +
    '.bgdash-kpi-sub{font-size:12px;color:#7b8790;margin-top:4px;}.bgdash-kpi-icon{position:absolute;right:14px;top:14px;font-size:24px;width:28px;height:28px;object-fit:contain;opacity:.55;}' +
    '.bgdash-kpi-sparkline{position:absolute;right:10px;bottom:9px;width:82px;height:30px;opacity:.78;pointer-events:none}.bgdash-sparkline-svg{display:block;width:100%;height:100%;overflow:visible}' +
    '.bgdash-sparkline-svg polyline{vector-effect:non-scaling-stroke;}' +
    '.bgdash-trend{font-size:12px;font-weight:600;margin-top:4px;}.bgdash-trend-up{color:#218838}.bgdash-trend-down{color:#c62828}.bgdash-trend-flat{color:#667681}' +
	'.bgdash-trend-empty{visibility:hidden;}' + 
    '.bgdash-primary{border-left:4px solid #337ab7}.bgdash-success{border-left:4px solid #28a745}.bgdash-warning{border-left:4px solid #f0ad4e}.bgdash-danger{border-left:4px solid #dc3545}' +
    '.bgdash-info{border-left:4px solid #17a2b8}.bgdash-dark{border-left:4px solid #495057}' +
    '.bgdash-badge{display:inline-block;padding:4px 8px;border-radius:12px;font-size:11px;font-weight:600;}' +
    '.bgdash-badge-primary{background:#e7f1fb;color:#245d8f}.bgdash-badge-success{background:#e5f5e9;color:#207a35}.bgdash-badge-warning{background:#fff2d8;color:#8a5a00}.bgdash-badge-danger{background:#fde7e9;' +
    'color:#a61b29}.bgdash-badge-info{background:#e2f5f8;color:#126b78}.bgdash-badge-dark{background:#e9ecef;color:#343a40}' +
    '.bgdash-progress{height:8px;background:#edf1f4;border-radius:6px;overflow:hidden;margin-top:7px}.bgdash-progress-bar{height:8px;background:#337ab7}.bgdash-progress-success{background:#28a745}' +
    '.bgdash-progress-warning{background:#f0ad4e}.bgdash-progress-danger{background:#dc3545}.bgdash-progress-info{background:#17a2b8}.bgdash-progress-dark{background:#495057}' +
    '.bgdash-line{padding:9px 0;border-bottom:1px solid #f0f2f4}.bgdash-line:last-child{border-bottom:0}.bgdash-line-head{display:flex;justify-content:space-between;align-items:center;gap:10px}' +
    '.bgdash-line-title{font-size:13px;font-weight:600}.bgdash-line-sub{font-size:11px;color:#7b8790;margin-top:2px}' +
    '.bgdash-funnel-step{margin:8px auto;height:28px;line-height:28px;text-align:center;color:#fff;border-radius:3px;background:#337ab7;min-width:120px;font-size:12px;white-space:nowrap;overflow:hidden;}' +
    '.bgdash-ranking-value{font-size:12px;font-weight:700;white-space:nowrap}.bgdash-progress-list-title{margin-bottom:8px}.bgdash-progress-list{width:100%;}.bgdash-progress-list-item{display:flex;' +
    'align-items:center;gap:8px;min-height:25px;margin-bottom:7px}.bgdash-progress-list-label{width:74px;min-width:74px;font-size:11px;color:#42515b;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}' +
    '.bgdash-progress-list-track{height:10px;flex:1;min-width:40px;background:#edf1f4;border-radius:0;overflow:hidden}.bgdash-progress-list-bar{height:100%;min-width:2px}.bgdash-progress-list-value{width:28px;' +
    'min-width:28px;text-align:right;font-size:11px;color:#263238;white-space:nowrap}' +
    '.bgdash-timeline{position:relative;padding-left:22px}.bgdash-timeline:before{content:"";position:absolute;left:7px;top:4px;bottom:4px;width:2px;background:#dfe5ea}.bgdash-timeline-item{position:relative;' +
    'padding:0 0 14px 0}.bgdash-timeline-dot{position:absolute;left:-20px;top:3px;width:10px;height:10px;border-radius:50%;background:#337ab7;border:2px solid #fff;box-shadow:0 0 0 1px #337ab7}' +
    '.bgdash-timeline-date{font-size:11px;color:#7b8790}.bgdash-timeline-title{font-size:13px;font-weight:600}.bgdash-timeline-text{font-size:12px;color:#56636c}' +
    '.bgdash-gauge-wrap{text-align:center}.bgdash-gauge-label{font-size:12px;color:#667681;margin-top:-8px}.bgdash-gauge-value{font-size:22px;font-weight:700;}' +
    '.bgdash-heat{border-collapse:separate;border-spacing:3px;width:100%}.bgdash-heat td,.bgdash-heat th{font-size:11px;text-align:center;padding:5px}.bgdash-heat-cell{border-radius:3px;color:#263238}' +
    '.bgdash-heat-1{background:#edf5fb}.bgdash-heat-2{background:#cfe5f5}.bgdash-heat-3{background:#93c5e7}.bgdash-heat-4{background:#4c9bd3;color:#fff}.bgdash-heat-5{background:#246da3;color:#fff}' +
    '.bgdash-alert{padding:10px 12px;border-radius:6px;margin-bottom:8px;background:#f7f9fa;border-left:4px solid #337ab7}.bgdash-alert-success{border-left-color:#28a745}' +
    '.bgdash-alert-warning{border-left-color:#f0ad4e}.bgdash-alert-danger{border-left-color:#dc3545}.bgdash-alert-info{border-left-color:#17a2b8}.bgdash-alert-dark{border-left-color:#495057}' +
    '.bgdash-click{cursor:pointer;text-decoration:none;color:inherit;display:block}.bgdash-click:hover{text-decoration:none;color:inherit;filter:brightness(.98)}' +
    '.bgdash-table-wrap{width:100%;overflow-x:auto}.bgdash-table{width:100%;border-collapse:collapse;background:#fff}.bgdash-table th{font-size:11px;text-transform:uppercase;letter-spacing:.25px;color:#667681;' +
    'text-align:left;padding:9px 10px;border-bottom:2px solid #e7ebef;white-space:nowrap}.bgdash-table td{font-size:12px;padding:9px 10px;border-bottom:1px solid #edf0f3;vertical-align:middle}' +
    '.bgdash-table tbody tr:hover{background:#f8fafb}.bgdash-table-link{display:block;color:inherit;text-decoration:none;min-height:18px}.bgdash-table-link:hover{color:inherit;text-decoration:none}' +
    '.bgdash-table-progress-text{font-size:11px;margin-bottom:3px;white-space:nowrap}.bgdash-table .bgdash-progress{min-width:90px;margin-top:0}.bgdash-table-click{cursor:pointer}' +
    '.bgdash-btn{border:0;border-radius:5px;padding:8px 13px;font-size:12px;cursor:pointer;color:#fff;background:#337ab7}.bgdash-button-icon{width:14px;height:14px;object-fit:contain;vertical-align:-2px}' +
    '.bgdash-btn-primary{background:#337ab7}.bgdash-btn-success{background:#28a745}.bgdash-btn-warning{background:#f0ad4e;color:#5c4300}.bgdash-btn-danger{background:#dc3545}.bgdash-btn-info{background:#17a2b8}' +
    '.bgdash-btn-dark{background:#495057}.bgdash-btn:hover{filter:brightness(.95)}' +
    '.bgdash-filterbar{background:#fff;border:1px solid #e4e9ef;border-radius:8px;padding:12px 14px;margin-bottom:12px}.bgdash-filter-title{font-size:13px;font-weight:600;margin-bottom:9px}' +
    '.bgdash-filter-fields{display:flex;align-items:flex-end;gap:0;flex-wrap:wrap}.bgdash-filter-field{display:flex;flex:0 0 auto;flex-direction:column;gap:4px;min-width:0;margin:0;overflow:hidden}' +
    '.bgdash-filter-field span{font-size:11px;color:#667681;font-weight:600;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.bgdash-filter-field input,.bgdash-filter-field select{width:100%;' +
    'min-width:0;max-width:100%;height:34px;border:1px solid #d9e0e5;border-radius:5px;padding:5px 8px;background:#fff;color:#263238;text-overflow:ellipsis;overflow:hidden}.bgdash-filter-action{padding-bottom:0}' +
    '' +
    '.bgdash-tabs{display:flex;gap:2px;border-bottom:1px solid #dfe5ea;margin-bottom:12px;overflow-x:auto}.bgdash-tab{border:0;background:transparent;padding:9px 13px;font-size:12px;color:#667681;cursor:pointer;' +
    'border-bottom:2px solid transparent;white-space:nowrap}.bgdash-tab i,.bgdash-tab img{margin-right:5px;font-size:11px;width:13px;height:13px;object-fit:contain;vertical-align:-2px}' +
    '.bgdash-tab.active{color:#337ab7;border-bottom-color:#337ab7;font-weight:600}.bgdash-tab-badge{background:#edf1f4;border-radius:9px;padding:1px 6px;font-size:10px}.bgdash-tabpane{padding:2px 0}' +
    '.bgdash-modal{position:fixed;z-index:99999;left:0;top:0;width:100%;height:100%;background:rgba(0,0,0,.38);align-items:center;justify-content:center;padding:20px}.bgdash-modal-dialog{background:#fff;' +
    'border-radius:9px;box-shadow:0 10px 35px rgba(0,0,0,.25);max-height:90vh;overflow:auto;width:640px}.bgdash-modal-sm{width:420px}.bgdash-modal-lg{width:850px}.bgdash-modal-xl{width:1100px}' +
    '.bgdash-modal-head{display:flex;justify-content:space-between;align-items:center;padding:13px 16px;border-bottom:1px solid #edf0f3}.bgdash-modal-title{font-size:15px;font-weight:600}' +
    '.bgdash-modal-close{border:0;background:transparent;font-size:24px;line-height:20px;cursor:pointer;color:#667681}.bgdash-modal-body{padding:16px}.bgdash-modal-foot{padding:0 16px 14px;display:flex;' +
    'justify-content:flex-end;gap:7px}' +
    '.bgdash-stepper{position:relative}.bgdash-step{display:flex;gap:12px;position:relative;padding:0 0 18px 4px}.bgdash-step:before{content:"";position:absolute;left:9px;top:18px;bottom:0;width:2px;' +
    'background:#e0e6eb}.bgdash-step:last-child:before{display:none}.bgdash-step-marker{width:12px;height:12px;margin-top:3px;border-radius:50%;background:#c8d0d6;border:2px solid #fff;' +
    'box-shadow:0 0 0 2px #c8d0d6;z-index:1}.bgdash-step-done .bgdash-step-marker{background:#28a745;box-shadow:0 0 0 2px #28a745}.bgdash-step-active .bgdash-step-marker{background:#337ab7;' +
    'box-shadow:0 0 0 2px #337ab7}.bgdash-step-warning .bgdash-step-marker{background:#f0ad4e;box-shadow:0 0 0 2px #f0ad4e}.bgdash-step-error .bgdash-step-marker{background:#dc3545;box-shadow:0 0 0 2px #dc3545}' +
    '.bgdash-step-content{flex:1}.bgdash-step-title{font-size:13px;font-weight:600}.bgdash-step-date{font-size:10px;color:#87939c;margin-top:1px}.bgdash-step-text{font-size:11px;color:#667681;margin-top:3px}' +
    '.bgdash-imagegrid{margin-left:-7px;margin-right:-7px}.bgdash-imagegrid-col{padding-left:7px;padding-right:7px;margin-bottom:14px}' +
    '.bgdash-imagecard{background:#fff;border:1px solid #e4e9ef;border-radius:8px;overflow:hidden;box-shadow:0 1px 3px rgba(0,0,0,.06);transition:transform .15s ease,box-shadow .15s ease;height:100%}' +
    '.bgdash-click .bgdash-imagecard:hover{transform:translateY(-2px);box-shadow:0 4px 12px rgba(0,0,0,.10)}' +
    '.bgdash-imagecard-img{display:block;width:100%;height:160px;object-fit:cover;background:#f3f5f7}.bgdash-imagecard-body{padding:11px 12px}.bgdash-imagecard-head{display:flex;justify-content:space-between;' +
    'align-items:flex-start;gap:8px}.bgdash-imagecard-title{font-size:13px;font-weight:700;color:#263640;line-height:18px}.bgdash-imagecard-sub{font-size:11px;color:#7b8790;margin-top:4px;line-height:16px}' +
    '.tbg-image-link{display:inline-block;cursor:pointer}' +
    '.bgdash-section-head{display:flex;align-items:flex-end;justify-content:space-between;gap:12px;margin:4px 0 12px}.bgdash-section-title{font-size:17px;font-weight:700;color:#1d2b36}' +
    '.bgdash-section-sub{font-size:11px;color:#7b8790;margin-top:2px}.bgdash-section-action{font-size:12px;font-weight:600;text-decoration:none;color:#337ab7;white-space:nowrap}' +
    '.bgdash-section-action:hover{text-decoration:underline}' +
    '.bgdash-compare{display:block;margin-top:5px;font-size:11px;line-height:15px}.bgdash-compare .bgdash-trend{display:block}.bgdash-compare-label{display:block;margin-top:1px;color:#7b8790}' +
    '.bgdash-compare-prev{display:block;color:#7b8790;font-size:10px;margin-top:2px}' +
    '.bgdash-empty{text-align:center;padding:30px 16px;color:#667681}.bgdash-empty-icon{display:inline-block;font-size:30px;width:30px;height:30px;object-fit:contain;color:#a7b2ba;margin-bottom:9px}' +
    '.bgdash-empty-title{font-size:14px;font-weight:700;color:#42515b}.bgdash-empty-text{font-size:12px;max-width:520px;margin:5px auto 12px}.bgdash-empty-btn{display:inline-block;text-decoration:none;' +
    'margin-top:4px}' +
    '.bgdash-skeleton{padding:8px 0}.bgdash-skeleton-line{height:12px;border-radius:6px;margin:9px 0;background:linear-gradient(90deg,#edf1f4 25%,#f7f9fa 50%,#edf1f4 75%);background-size:200% 100%;' +
    'animation:bgdash-shimmer 1.25s infinite}.bgdash-skeleton-1{width:92%}.bgdash-skeleton-2{width:76%}.bgdash-skeleton-3{width:84%}@keyframes bgdash-shimmer{0%{background-position:200% 0}' +
    '100%{background-position:-200% 0}}' +
    '.bgdash-divider{height:1px;background:#e7ebef;margin:14px 0}.bgdash-divider-caption{display:flex;align-items:center;gap:9px;color:#7b8790;font-size:10px;text-transform:uppercase;letter-spacing:.4px;' +
    'margin:14px 0}.bgdash-divider-caption:before,.bgdash-divider-caption:after{content:"";height:1px;background:#e7ebef;flex:1}' +
    '.bgdash-filter-check{display:flex;align-items:center;gap:0;min-height:34px;padding:0 3px;font-size:12px;color:#42515b;cursor:pointer}.bgdash-filter-multi{width:100%;max-height:140px;overflow-y:auto;' +
    'border:1px solid #d9e0e5;border-radius:5px;padding:5px 6px;background:#fff}.bgdash-filter-multi .bgdash-filter-check{gap:0;min-height:26px;padding:0 2px;margin:0;font-size:11px}' +
    '.bgdash-filter-multi .bgdash-filter-check input{width:15px;min-width:15px;height:15px}' +
    '.bgdash-date-popup{position:absolute;z-index:100000;width:224px;padding:8px;background:#fff;border:1px solid #d9e0e5;border-radius:6px;box-shadow:0 4px 14px rgba(0,0,0,.18);font-family:Segoe UI,Arial,' +
    'sans-serif}.bgdash-date-head{display:flex;align-items:center;justify-content:space-between;margin-bottom:6px;color:#263238}.bgdash-date-head strong{font-size:12px}.bgdash-date-head button{width:25px;' +
    'height:24px;border:0;border-radius:4px;background:#edf1f4;color:#263238;cursor:pointer}.bgdash-date-week,.bgdash-date-grid{display:flex;flex-wrap:wrap;text-align:center}.bgdash-date-week{margin-bottom:2px;' +
    'color:#7b8790;font-size:10px}' +
    '.bgdash-date-week span,.bgdash-date-grid button,.bgdash-date-grid span{width:14.2857%;height:25px;padding:0;border:0;border-radius:3px;background:#fff;color:#263238;font-size:11px;line-height:25px;' +
    'box-sizing:border-box}.bgdash-date-grid button{cursor:pointer}.bgdash-date-grid button:hover{background:#337ab7;color:#fff}.bgdash-filter-check input{width:16px;height:16px;margin-right:6px;' +
    'vertical-align:middle}' +
    '.bgdash-click{cursor:pointer}.bgdash-click:hover{text-decoration:none}.bgdash-heat-cell .bgdash-click{display:block;width:100%;height:100%}.bgdash-drilldown,.bgdash-crossfilter{margin-right:6px;margin-bottom:6px}' +
    '.bgdash{width:100%;max-width:none;padding:10px 14px;}' +
    '.bgdash-row{align-items:stretch;}' +
    '.bgdash-col{display:flex;flex-direction:column;}' +
    '.bgdash-col>.bgdash-panel,.bgdash-col>.bgdash-click,.bgdash-col>.bgdash-kpi{width:100%;}' +
    '.bgdash-col>.bgdash-panel{flex:1 1 auto;}' +
    '.bgdash-panel{display:flex;flex-direction:column;}' +
    '.bgdash-panel-body{flex:1 1 auto;min-width:0;}' +
    '.bgdash-kpi{height:100%;min-height:116px;display:flex;flex-direction:column;justify-content:center;padding-right:42px;}' +
    '.bgdash-kpi-value{white-space:nowrap;font-size:clamp(18px,1.55vw,26px);line-height:1.2;overflow:hidden;text-overflow:ellipsis;}' +
    '.bgdash-compare-prev:empty{display:none}' +
    '.bgdash-panel-body canvas{max-height:300px!important;}' +
    '.bgdash-funnel{display:block;min-height:220px;padding:6px 2px;}' +
    '.bgdash-funnel-step{display:block;height:34px;min-width:0;max-width:100%;margin:0 auto;padding:0;overflow:visible;vertical-align:middle;}' +
    '.bgdash-funnel-label{overflow:hidden;text-overflow:ellipsis}.bgdash-funnel-value{margin-left:auto}.bgdash-funnel-extra{font-size:10px;opacity:.85}' +
    '.bgdash-funnel-1{color:#2d8cff}.bgdash-funnel-2{color:#45a3ee}.bgdash-funnel-3{color:#f0525d}.bgdash-funnel-4{color:#f5a623}.bgdash-funnel-5{color:#31b96b}' +
    '.bgdash-timeline{padding-left:0;position:relative}.bgdash-timeline:before{display:none}' +
    '.bgdash-timeline-item{display:grid;grid-template-columns:112px 22px minmax(0,1fr);gap:8px;align-items:start;padding:9px 0;border-bottom:1px solid #edf0f3;position:relative;}' +
    '.bgdash-timeline-item:last-child{border-bottom:0}.bgdash-timeline-date{text-align:right;font-size:10px;color:#667681;padding-top:2px;white-space:nowrap}' +
    '.bgdash-timeline-marker{position:relative;min-height:34px}.bgdash-timeline-marker:after{content:"";position:absolute;left:10px;top:14px;bottom:-19px;width:1px;background:#dfe5ea}' +
    '.bgdash-timeline-item:last-child .bgdash-timeline-marker:after{display:none}.bgdash-timeline-dot{position:absolute;left:5px;top:3px;width:11px;height:11px}' +
    '.bgdash-timeline-content{min-width:0}.bgdash-timeline-title{font-size:12px;line-height:16px}.bgdash-timeline-text{font-size:11px;line-height:15px;color:#7b8790}' +
    '.bgdash-gauge-wrap{float:left;width:42%;text-align:center;padding:4px 8px 8px}.bgdash-gauge-ring{position:relative;width:128px;height:128px;max-width:100%;margin:0 auto}.bgdash-gauge-ring svg{width:100%;height:100%;display:block}' +
    '.bgdash-gauge-center{position:absolute;inset:0;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:22px}.bgdash-gauge-value{font-size:24px;font-weight:800;line-height:1.05}' +
    '.bgdash-gauge-label{font-size:10px;line-height:13px;color:#56636c;margin-top:4px}.bgdash-gauge-sub{font-size:10px;color:#87939c;margin-top:2px}' +
    '.bgdash-status-item{margin-left:45%;min-height:42px;border:1px solid #e7ebef;border-radius:6px;margin-bottom:7px;padding:6px 8px;display:grid;grid-template-columns:43px 1fr auto;gap:8px;align-items:center;background:#fff}' +
    '.bgdash-status-percent{height:28px;border-radius:5px;color:#fff;font-weight:700;font-size:10px;display:flex;align-items:center;justify-content:center;background:#337ab7}.bgdash-status-title{font-size:11px;' +
    'color:#42515b}.bgdash-status-value{font-size:11px;font-weight:700;color:#263238;white-space:nowrap}' +
    '.bgdash-status-success .bgdash-status-percent{background:#28a745}.bgdash-status-warning .bgdash-status-percent{background:#f0ad4e}.bgdash-status-danger .bgdash-status-percent{background:#dc3545}' +
    '.bgdash-status-info .bgdash-status-percent{background:#17a2b8}.bgdash-status-dark .bgdash-status-percent{background:#495057}' +
    '.bgdash-status-item+.bgdash-drilldown,.bgdash-status-item~.bgdash-drilldown{clear:both}.bgdash-panel-body:after{content:"";display:block;clear:both}' +
    '.bgdash-quick-action{display:flex;align-items:center;gap:10px;width:100%;min-height:46px;padding:7px 9px;margin-bottom:7px;border:1px solid #e4e9ef;border-radius:7px;background:#fff;color:#263238;' +
    'text-decoration:none;transition:background .12s ease,border-color .12s ease,transform .12s ease}' +
    '.bgdash-quick-action:hover{background:#f8fbfd;border-color:#cfdbe5;text-decoration:none;color:#263238;transform:translateY(-1px)}.bgdash-quick-icon{width:32px;height:32px;border-radius:6px;display:flex;' +
    'align-items:center;justify-content:center;background:#e7f1fb;color:#337ab7;font-size:14px}.bgdash-quick-symbol{width:16px;height:16px;object-fit:contain}.bgdash-quick-icon-success{background:#e5f5e9;' +
    'color:#28a745}.bgdash-quick-icon-warning{background:#fff2d8;color:#b77900}.bgdash-quick-icon-danger{background:#fde7e9;color:#dc3545}.bgdash-quick-icon-info{background:#e2f5f8;color:#17a2b8}' +
    '.bgdash-quick-caption{font-size:12px;font-weight:600;flex:1}.bgdash-quick-arrow{font-size:22px;color:#8da0ad;line-height:1}' +
    '.bgdash-table-actions-head{text-align:center!important;width:76px}.bgdash-table-actions{text-align:center;white-space:nowrap}.bgdash-table-action{display:inline-flex;align-items:center;' +
    'justify-content:center;width:26px;height:26px;margin:0 2px;border-radius:5px;color:#536875;text-decoration:none}.bgdash-table-action:hover{background:#eef4f8;color:#337ab7;text-decoration:none}' +
    '.bgdash-heat{table-layout:fixed;border-spacing:4px;width:100%}.bgdash-heat th:first-child{width:76px;text-align:right;padding-right:8px;font-weight:600;color:#536875}' +
    '.bgdash-heat tr:first-child th:not(:first-child){text-align:center;font-weight:600;padding:2px 1px;color:#667681;white-space:nowrap}.bgdash-heat-cell{height:28px;padding:0!important;overflow:hidden}' +
    '.bgdash-heat-value{display:block;width:100%;height:100%;font-size:0;color:transparent}.bgdash-heat-cell .bgdash-click{width:100%;height:100%;display:block}' +
    '.bgdash-drilldown{display:inline-flex;align-items:center;justify-content:center;text-decoration:none}.bgdash-gauge-wrap~.bgdash-drilldown{margin-left:45%;margin-top:4px}' +
    '.bgdash-panel-body>.col-12,.bgdash-panel-body .col-12{width:100%;max-width:100%;padding:0;float:none;}' +
    '.bgdash-panel-body canvas{display:block!important;width:100%!important;max-width:100%!important;margin:0 auto;}' +
    '.bgdash-table{width:100%;table-layout:auto}.bgdash-table th,.bgdash-table td{vertical-align:middle}.bgdash-table th{white-space:nowrap}.bgdash-table td{white-space:nowrap}.bgdash-table td:nth-child(3){white-space:normal}' +
    '.bgdash-funnel{display:block;min-height:220px;padding:6px 2px}.bgdash-funnel-row{display:flex;align-items:center;width:100%;height:34px;margin:0}.bgdash-funnel-barbox{position:relative;width:62%;' +
    'height:34px;overflow:hidden;padding-right:10px;box-sizing:border-box}.bgdash-funnel-step{position:absolute;display:block;left:50%;top:0;height:34px;margin:0;padding:0;min-width:0;max-width:100%;' +
    'overflow:hidden;transform:translateX(-50%);vertical-align:middle;background:transparent;border:0;border-radius:0;outline:0}.bgdash-funnel-caption{width:38%;min-width:0;display:flex;align-items:center;' +
    'font-size:11px;color:#42515b;white-space:nowrap;box-sizing:border-box}.bgdash-funnel-label{display:inline-block;overflow:hidden;text-overflow:ellipsis;max-width:72%;padding-right:6px}' +
    '.bgdash-funnel-value{display:inline-block;margin-left:auto;font-size:12px;color:#1d2b36}.bgdash-funnel-extra{display:none}' +
    '.bgdash-timeline{position:relative;padding-left:0}' +
    '.bgdash-timeline:before{content:"";display:block;position:absolute;left:8px;top:12px;bottom:12px;width:2px;background:#dfe5ea}' +
    '.bgdash-timeline-item{display:flex;position:relative;align-items:flex-start;padding:4px 0;border-bottom:1px solid #edf0f3;min-height:34px}' +
    '.bgdash-timeline-item:last-child{border-bottom:0}' +
    '.bgdash-timeline-marker{position:relative;width:18px;min-width:18px;height:26px;margin-right:8px}' +
    '.bgdash-timeline-marker:after{display:none}' +
    '.bgdash-timeline-dot{position:absolute;left:1px;top:2px;width:15px;height:15px;border-radius:50%;border:2px solid #fff;box-shadow:0 0 0 1px #8ca0ae;z-index:2;color:#fff;text-align:center;font-size:7px;line-height:11px}' +
    '.bgdash-timeline-dot i{display:block;font-style:normal;line-height:11px}' +
    '.bgdash-timeline-date{width:108px;min-width:108px;text-align:left;font-size:10px;color:#667681;padding-top:1px;white-space:nowrap;margin-right:10px}' +
    '.bgdash-timeline-content{flex:1;min-width:0}' +
    '.bgdash-timeline-title{font-size:11px;line-height:14px;font-weight:600;color:#263238}' +
    '.bgdash-timeline-text{font-size:10px;line-height:13px;color:#7b8790;margin-top:0}' +
    '.bgdash-gauge-wrap{float:left;width:44%;text-align:center;padding:4px 8px 8px}.bgdash-gauge-ring{position:relative;width:132px;height:132px;max-width:100%;margin:0 auto}.bgdash-gauge-ring svg{display:block;' +
    'width:100%;height:100%}.bgdash-gauge-center{position:absolute;top:0;right:0;bottom:0;left:0;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:23px}' +
    '.bgdash-gauge-value{font-size:24px;font-weight:800;line-height:26px}.bgdash-gauge-label{font-size:10px;line-height:12px;color:#56636c;margin-top:3px}.bgdash-gauge-sub{display:none}' +
    '.bgdash-status-item{margin-left:47%;min-height:48px;border:1px solid #e7ebef;border-radius:6px;margin-bottom:7px;padding:6px 7px;display:flex;align-items:center;background:#fff}' +
    '.bgdash-status-percent{width:44px;min-width:44px;height:30px;margin-right:8px;border-radius:5px;color:#fff;font-weight:700;font-size:10px;display:flex;align-items:center;justify-content:center;' +
    'background:#337ab7}.bgdash-status-title{font-size:11px;color:#42515b;flex:1 1 auto;min-width:0;overflow:hidden;word-wrap:break-word}.bgdash-status-value{font-size:12px;font-weight:700;color:#263238;' +
    'white-space:nowrap;margin-left:6px;flex:0 0 auto}' +
    '.bgdash-quick-action{display:flex;align-items:center;min-height:48px;padding:7px 10px;margin-bottom:7px}.bgdash-quick-icon{margin-right:10px}.bgdash-quick-caption{flex:1}.bgdash-quick-arrow{margin-left:8px}' +
    '.bgdash-heat-legend{display:flex;align-items:center;justify-content:center;margin-top:9px;font-size:10px;color:#73808a}.bgdash-heat-legend-label{margin:0 7px}.bgdash-heat-legend-box{display:inline-block;' +
    'width:28px;height:10px;margin:0 1px;border-radius:1px}' +
    '@media(max-width:900px){.bgdash-kpi-value{font-size:22px}.bgdash-status-item{margin-left:0}.bgdash-gauge-wrap{float:none;width:100%}.bgdash-gauge-wrap~.bgdash-drilldown{margin-left:0}' +
    '.bgdash-timeline-item{grid-template-columns:92px 22px minmax(0,1fr)}}' +
    '@media(max-width:575px){.bgdash-col{flex:0 0 100%!important;max-width:100%!important}.bgdash{padding:8px}.bgdash-timeline-item{grid-template-columns:1fr}.bgdash-timeline-date{text-align:left}.bgdash-timeline-marker{display:none}}' +
    '.bgdash-gauge-wrap{float:left;width:44%;text-align:center;padding:5px 8px 8px;box-sizing:border-box}' +
    '.bgdash-gauge-ring{position:relative;width:132px;height:132px;max-width:100%;margin:0 auto}' +
    '.bgdash-gauge-ring svg{display:block;width:100%;height:100%;overflow:visible}' +
    '.bgdash-gauge-svg-value{font-family:Arial,sans-serif;font-size:20px;font-weight:700;fill:#1f2933}' +
    '.bgdash-gauge-svg-label{font-family:Arial,sans-serif;font-size:8px;fill:#60717d}' +
    '.bgdash-gauge-center,.bgdash-gauge-sub{display:none!important}' +
    '.bgdash-status-item{margin-left:47%;min-height:48px;border:1px solid #e7ebef;border-radius:6px;margin-bottom:7px;padding:6px 7px;display:flex;align-items:center;background:#fff;box-sizing:border-box}' +
    '.bgdash-status-title{flex:1 1 auto;min-width:0;overflow:hidden;word-wrap:break-word}.bgdash-status-value{flex:0 0 auto}' +
    '</style>';
end;

end.
