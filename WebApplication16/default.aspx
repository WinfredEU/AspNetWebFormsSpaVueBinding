﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication16._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>asp.net WebForms SPA Vue Binding </title>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/vue.min.js"></script>
    <script src="Scripts/isRockFx.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script>
        var vd_StudentInfo;  //view data
        var vm_StudentInfo; //vue instance
        //設定資料繫結
        function SetBinding() {
            //create vue instance
            vm_StudentInfo = new Vue(
                        {
                            el: '#tableBody',
                            data: { items: vd_StudentInfo },
                        });
        }

        //從伺服器端取得資料
        function GetData() {
            CallPageMethod('GetData', null,
                //success
                function (result) {
                    vm_StudentInfo.items = result.Data;
                }
             );
        }

        //清空
        function Clear() {
            vm_StudentInfo.items = undefined;
        }

        //ready
        $(function () {
            //設定DataBinding
            SetBinding();
            //設定Button Event Hook
            $('#ButtonGetData').click(GetData);
            $('#ButtonClear').click(Clear);
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-12" style="margin: 10px">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        範例 : Vue.js  資料表前端Template Rendering (.aspx版)
                    </div>
                    <div class="panel-body">
                        <button type="button" id="ButtonGetData" class="btn btn-primary">Get Data</button>
                      <button type="button" id="ButtonClear" class="btn btn-primary">清空</button>
                </div>
                    <br />
                    <!-- 表格開始 -->
                    <div style="margin: 10px"  id="tableBody">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="min-width: 45px">姓名</th>
                                    <th style="min-width: 45px">身高</th>
                                    <th style="min-width: 45px">體重</th>
                                    <th style="min-width: 45px">BMI</th>
                                    <th style="min-width: 45px">備註</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="item in items">
                                    <td>
                                        <span>{{item.StudentName}}</span>
                                    </td>
                                    <td>
                                        <span>{{item.Height}}</span>
                                    </td>
                                    <td>
                                        <span>{{item.Weight}}</span>
                                    </td>
                                    <td>
                                        <span>{{item.BMIValue}}</span>
                                    </td>
                                    <td>
                                        <span>{{item.Memo}}</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
