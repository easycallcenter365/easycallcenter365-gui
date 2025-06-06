// 从隐藏的 HTML 元素中读取变量
var ROOT = document.getElementById('root-path').textContent;
var LANG_COUNTRY = document.getElementById('lang-country').textContent;
var I18N = $.i18n;

// 初始化i18n插件
$.i18n.properties({
    path: ROOT + '/i18n/', // 国际化文件路径
    name: 'messages', // 文件名开头
    language: LANG_COUNTRY, // 语言区域
    mode: 'map', // 默认值
});

// 初始化i18n函数
function i18n(msgKey) {
    try {
        return I18N.prop(msgKey);
    } catch (e) {
        console.error(e)
        return msgKey; // 如果找不到翻译则返回键值
    }
}