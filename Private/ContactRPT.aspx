<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ContactRPT.aspx.vb" Inherits="Private_ContactRPT" %>

<%@ Register assembly="DevExpress.XtraReports.v9.2.Web, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dxxr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <dxxr:ReportToolbar ID="ReportToolbar1" runat="server" 
        ReportViewer="<%# ReportViewer1 %>" ShowDefaultButtons="False">
        <Items>
            <dxxr:ReportToolbarButton ItemKind="Search" />
            <dxxr:ReportToolbarSeparator />
            <dxxr:ReportToolbarButton ItemKind="PrintReport" />
            <dxxr:ReportToolbarButton ItemKind="PrintPage" />
            <dxxr:ReportToolbarSeparator />
            <dxxr:ReportToolbarButton Enabled="False" ItemKind="FirstPage" />
            <dxxr:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" />
            <dxxr:ReportToolbarLabel ItemKind="PageLabel" />
            <dxxr:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
            </dxxr:ReportToolbarComboBox>
            <dxxr:ReportToolbarLabel ItemKind="OfLabel" />
            <dxxr:ReportToolbarTextBox IsReadOnly="True" ItemKind="PageCount" />
            <dxxr:ReportToolbarButton ItemKind="NextPage" />
            <dxxr:ReportToolbarButton ItemKind="LastPage" />
            <dxxr:ReportToolbarSeparator />
            <dxxr:ReportToolbarButton ItemKind="SaveToDisk" />
            <dxxr:ReportToolbarButton ItemKind="SaveToWindow" />
            <dxxr:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
                <elements>
                    <dxxr:ListElement Value="pdf" />
                    <dxxr:ListElement Value="xls" />
                    <dxxr:ListElement Value="xlsx" />
                    <dxxr:ListElement Value="rtf" />
                    <dxxr:ListElement Value="mht" />
                    <dxxr:ListElement Value="txt" />
                    <dxxr:ListElement Value="csv" />
                    <dxxr:ListElement Value="png" />
                </elements>
            </dxxr:ReportToolbarComboBox>
        </Items>
        <styles>
            <LabelStyle>
            <margins marginleft="3px" marginright="3px" />
            </LabelStyle>
        </styles>
    </dxxr:ReportToolbar>
    <dxxr:ReportViewer ID="ReportViewer1" runat="server">
    </dxxr:ReportViewer>
    </form>
</body>
</html>
