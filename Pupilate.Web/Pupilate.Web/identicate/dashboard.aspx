<%@ Page Title="" Language="C#" MasterPageFile="~/identicate/master.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Pupilate.Web.identicate.dashboard" %>

<asp:Content ID="contentHead" ContentPlaceHolderID="masterHeadPlaceHolder" runat="server">
    <title>Pupilate - Dashboard</title>
</asp:Content>

<asp:Content ID="contentRight" ContentPlaceHolderID="masterBodyRight" runat="server">
   <div class="sb-site">
       <div class="boxed">
           <div class="col-md-9">
                            <section class="css-section">
                                <h2 class="section-title no-margin-top">General Usage Statistics</h2>
                                <div class="alert alert-info">Artificial reason contains the library <a href="https://github.com/lugolabs/circles">circles.js</a> to create statistical circles. You can use all you need, here are some examples.</div>
                                <hr class="dotted" />
                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-1"></div>
                                            <h4 class="text-center">HTML 5</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-2"></div>
                                            <h4 class="text-center">CSS 3</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-3"></div>
                                            <h4 class="text-center">Jquery</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-4"></div>
                                            <h4 class="text-center">Bootstrap 3</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                </div>
                                <h2 class="section-title">Diferent Size</h2>
                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-5"></div>
                                            <h4 class="text-center">HTML 5</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-6"></div>
                                            <h4 class="text-center">CSS 3</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-7"></div>
                                            <h4 class="text-center">Jquery</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-8"></div>
                                            <h4 class="text-center">Bootstrap 3</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                </div>
                                <h2 class="section-title">Diferent colors</h2>
                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-9"></div>
                                            <h4 class="text-center">HTML 5</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-10"></div>
                                            <h4 class="text-center">CSS 3</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-11"></div>
                                            <h4 class="text-center">Jquery</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-12"></div>
                                            <h4 class="text-center">Bootstrap 3</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                </div>
                                <h2 class="section-title">More sizes and colors</h2>
                                <div class="alert alert-info">
                                    You can combine all colors and thickness you need. And give the values ​​and manipulate them through their api with javascript.
                                </div>
                                <hr class="dotted">
                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-13"></div>
                                            <h4 class="text-center">HTML 5</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-14"></div>
                                            <h4 class="text-center">CSS 3</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-15"></div>
                                            <h4 class="text-center">Jquery</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="text-center">
                                            <div class="circle" id="circles-16"></div>
                                            <h4 class="text-center">Bootstrap 3</h4>
                                            <p class="small-font">Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
       </div>
   </div>
</asp:Content>

<%--<asp:Content ID="contentDashboardWelcome" ContentPlaceHolderID="MasterDashboardWelcome" runat="server">
    
</asp:Content>

<asp:Content ID="contentBodyMain" ContentPlaceHolderID="masterBodyRight" runat="server">
    <div class="container">
        <div class="row">
            
        </div>
    </div>
</asp:Content>--%>
