/**
 * Bootstrap Table Chinese translation
 * Author: Zhixin Wen<wenzhixin2010@gmail.com>
 */
$.fn.bootstrapTable.locales['en-US'] = {
  formatShowSearch: function formatShowSearch() {
    return 'Hide/Show Search';
  },
  formatPageGo: function formatPageGo() {
    return 'jump to';
  },
  formatCopyRows: function formatCopyRows() {
    return 'Copy Row';
  },
  formatPrint: function formatPrint() {
    return 'Print';
  },
  formatLoadingMessage: function formatLoadingMessage() {
    return 'Trying to load data, please wait';
  },
  formatRecordsPerPage: function formatRecordsPerPage(pageNumber) {
    return "Display ".concat(pageNumber, " records per page");
  },
  formatShowingRows: function formatShowingRows(pageFrom, pageTo, totalRows, totalNotFiltered) {
    if (totalNotFiltered !== undefined && totalNotFiltered > 0 && totalNotFiltered > totalRows) {
      return "Display the ".concat(pageFrom, " to ").concat(pageTo, " records，a total of ").concat(totalRows, " records (filtered from the total of ").concat(totalNotFiltered, " records）");
    }
    return "Display the ".concat(pageFrom, " to ").concat(pageTo, " records，a total of ").concat(totalRows, " records");
  },
  formatSRPaginationPreText: function formatSRPaginationPreText() {
    return 'previous page';
  },
  formatSRPaginationPageText: function formatSRPaginationPageText(page) {
    return "Page".concat(page, "");
  },
  formatSRPaginationNextText: function formatSRPaginationNextText() {
    return 'next page';
  },
  formatDetailPagination: function formatDetailPagination(totalRows) {
    return "a total of ".concat(totalRows, " records");
  },
  formatClearSearch: function formatClearSearch() {
    return 'Clear filter';
  },
  formatSearch: function formatSearch() {
    return 'search for';
  },
  formatNoMatches: function formatNoMatches() {
    return 'No matching records found';
  },
  formatPaginationSwitch: function formatPaginationSwitch() {
    return 'Hide/Show Paging';
  },
  formatPaginationSwitchDown: function formatPaginationSwitchDown() {
    return 'Show Paging';
  },
  formatPaginationSwitchUp: function formatPaginationSwitchUp() {
    return 'Hide Paging';
  },
  formatRefresh: function formatRefresh() {
    return 'Refresh';
  },
  formatToggle: function formatToggle() {
    return 'switch';
  },
  formatToggleOn: function formatToggleOn() {
    return 'Show card view';
  },
  formatToggleOff: function formatToggleOff() {
    return 'Hide card view';
  },
  formatColumns: function formatColumns() {
    return 'column';
  },
  formatColumnsToggleAll: function formatColumnsToggleAll() {
    return 'Switch all';
  },
  formatFullscreen: function formatFullscreen() {
    return 'full screen';
  },
  formatAllRows: function formatAllRows() {
    return 'all';
  },
  formatAutoRefresh: function formatAutoRefresh() {
    return 'auto refresh';
  },
  formatExport: function formatExport() {
    return 'Export data';
  },
  formatJumpTo: function formatJumpTo() {
    return 'jump to';
  },
  formatAdvancedSearch: function formatAdvancedSearch() {
    return 'advanced search';
  },
  formatAdvancedCloseButton: function formatAdvancedCloseButton() {
    return 'close';
  },
  formatFilterControlSwitch: function formatFilterControlSwitch() {
    return 'Hide/Show Filter Control';
  },
  formatFilterControlSwitchHide: function formatFilterControlSwitchHide() {
    return 'Hide Filter Control';
  },
  formatFilterControlSwitchShow: function formatFilterControlSwitchShow() {
    return 'Show Filter Control';
  }
};
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['en-US']);
