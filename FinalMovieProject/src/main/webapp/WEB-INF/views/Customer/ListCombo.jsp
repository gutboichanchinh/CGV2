<%@page import="my.com.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../Page/Head.jsp" />
<%-- <jsp:include page="../Page/Background.jsp" /> --%>
<jsp:include page="../Page/Header.jsp" />
<body>
    <div class="container-fluid">
        <div class="inside col-11 d-flex">
            <div id="choice-seat" class="col-9 left">
                <div class="border-view">
                    <div class="scroll">
                        <div class="width-form">
                            <div class="screan col-8 bg-light border"></div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A1">
                                    <div id="A1">A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A2">
                                    <div id="A2">A2</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A3">
                                    <div id="A3">A3</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A4">
                                    <div id="A4">A4</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A5">
                                    <div id="A5">A5</div>
                                </label>
                                <label class="seat choised">
                                    <input type="checkbox" checked disabled="disabled">

                                    <img src="IMG/disableddd.png" width="30px" height="30px">
                                </label>
                                <label class="seat choised">
                                    <input type="checkbox" checked disabled="disabled">

                                    <img src="IMG/disableddd.png" width="30px" height="30px">
                                </label>
                                <label class="seat choised">
                                    <input type="checkbox" checked disabled="disabled">

                                    <img src="IMG/disableddd.png" width="30px" height="30px">
                                </label>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A9">
                                    <div id="A9">A9</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A10">
                                    <div id="A10">A10</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A11">
                                    <div id="A11">A11</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A12">
                                    <div id="A12">A12</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A13">
                                    <div id="A13">A13</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A14">
                                    <div id="A14">A14</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox" class="check" value="A15">
                                    <div id="A15">A15</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A16</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A17</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A18</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A19</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A20</div>
                                </label>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <div class="space"></div>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>
                                <label class="seat">
                                    <input type="checkbox">
                                    <div>A1</div>
                                </label>

                            </div>
                            <div class="tip">
                                <div class="chon col-1"></div>
                                <div class="chon chonnt col-3">
                                    <div class="iconseat1 bg-white"></div>
                                    <div class="statusseat">Ghế Chưa Chọn</div>
                                </div>
                                <div class="chon choning col-3">
                                    <div class="iconseat1 bg-success"></div>
                                    <div class="statusseat">Ghế Đang Chọn</div>
                                </div>
                                <div class="chon choned col-3">
                                    <div class="iconseat1 bg-secondary"></div>
                                    <div class="statusseat">Ghế Đã Được Chọn</div>
                                </div>
                                <div class="chon col-1"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-10 bottom">
                    <div class="left-bottom"><img src="IMG/2.jpg" width="100%"></div>
                    <hr>
                    <div class="right-bottom col-8">
                        <div class="ticket-bottom">
                            <form action="">
                                <div class="form-group row mt-2">
                                    <label for="staticEmail" class="text-center fs-3">Tên Phim</label>
                                </div>
                                <div class="form-group row">
                                    <div class="col m-2">
                                        <label>Phòng : </label>
                                        <div class="title-title">
                                            <p style="width: 5em; 
                                word-wrap: break-word;">asdasdas</p>
                                        </div>
                                    </div>
                                    <div class="col m-2">
                                        <label>Số vé : </label>
                                        <div class="title-title">
                                            <p style="width: 5em; 
                                word-wrap: break-word;">asdasdas</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col m-2">
                                        <label>Ngày : </label>
                                        <div class="title-title">
                                            <p style="width: 5em; 
                                word-wrap: break-word;">asdasdas</p>
                                        </div>
                                    </div>
                                    <div class="col m-2">
                                        <label>Giờ : </label>
                                        <div class="title-title">
                                            <p style="width: 5em; 
                                word-wrap: break-word;">asdasdas</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row m-2">
                                    <label for="staticEmail" class="col-3 col-form-label">Vé:</label>
                                    <div class="col-8">
                                        <p style="width: 9em; word-wrap: break-word;" id="staticEmailghe"></p>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin: 0 auto; width: 60%;">
                                    <input type="button" style="margin: 25px auto;" value="Tiep Tuc">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div id="choice-food" class="leftt col-9 row" hidden="hidden">
                <div style="height: 785px;">
                    <div class="combo-left col-12 row">
                     <%List<Combo> datas = (List<Combo>) request.getAttribute("dto"); %>
 
                    <%for (Combo combo : datas){ %>
                        <div class="combo-tag row col-12">
                            <div class="col-img col-2">
                                <div class="combo-img"><img src="${pageContext.request.contextPath}/resourses/IMG/<%= combo.getComboImage()%>"></div>
                            </div>
                            <div class="col-inf col-4">
                                <div class="combo-name"><%=combo.getComboName()%></div>
                                <div class="combo-inf"><%=combo.getComboDescription()%></div>
                            </div>
                            <div class="col-number col-2">
                                <div class="input-counter">
                                    <span class="minus-btn" onclick="minus(this)"><i class="fa-solid fa-minus"></i></span>
                                    <input class="input-number" onchange="comboUpdate(this)" type="text" value="0">
                                    <span class="plus-btn" type="button" onclick="plus(this)"><i class="fa-solid fa-plus"></i></span>
                                </div>
                            </div>
                            <div class="col-price col-2">
                                <%=combo.getComboPrice()%>
                            </div>
                            <div class="col-total-price col-2">
                                0
                            </div>
                        </div>
                   <%}%>
              
                        </div>
                        

                        
                    </div>
                </div>
            </div>
            <div class="col-3 right">
                <div class="ticket">
                    <form action="">
                        <div class="form-group row">
                            <div class="col-sm-12 mt-3">
                                <img src="IMG/2.jpg" width="100%">
                            </div>
                        </div>
                        <hr>
                        <div class="form-group row mt-2">
                            <label for="staticEmail" class="text-center fs-3">Tên Phim</label>
                        </div>
                        <div class="form-group row">
                            <div class="col m-3">
                                <label>Phòng : </label>
                                <p style="width: 8em; 
                                word-wrap: break-word;">asdasdas</p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col m-3">
                                <label>Số vé : </label>
                                <p style="width: 8em; 
                                word-wrap: break-word;">asdasdas</p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col m-3">
                                <label>Ngày : </label>
                                <p style="width: 8em; 
                                word-wrap: break-word;">asdasdas</p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col m-3">
                                <label>Giờ : </label>
                                <p style="width: 8em; 
                                word-wrap: break-word;">asdasdas</p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col m-3">
                                <label>Vé : </label>
                                <p style="width: 11em; word-wrap: break-word;" id="staticEmailghe2"></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col m-3">
                                <label>Combo : </label>
                                <p style="width: 11em; word-wrap: break-word;" id="odered-combo"></p>
                            </div>
                        </div>
                        <div class="form-group row" style="margin-top: 12%; width: 60%;">
                            <div id=""></div>
                            <input id="choning" name="chonghe" type="button" value="Chon do an" onclick="changeseat()">
                        </div>
                        <div class="form-group row" style="margin-top: 10%; width: 60%;">
                            <input type="button" value="Tiep Tuc">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

<script>
    function changeseat() {
        var click = document.getElementById("choning").value
        if (click == "Chon ghe") {
            document.getElementById("choning").value = "Chon do an";
            document.getElementById("choice-seat").removeAttribute("hidden");
            document.getElementById("choice-food").setAttribute("hidden", "hidden");
        } else {
            document.getElementById("choning").value = "Chon ghe";
            document.getElementById("choice-food").removeAttribute("hidden");
            document.getElementById("choice-seat").setAttribute("hidden", "hidden");
        }
    }




    const left = document.querySelector('.left');
    var arr = [];

    function updateselect() {
        const select = document.querySelectorAll('.selected');
        document.getElementById('staticEmailghe').innerHTML = arr.sort();
        document.getElementById('staticEmailghe2').innerHTML = arr.sort();
    }

    left.addEventListener('change', (e) => {
        var ele = document.getElementById(e.target.value)
        if (!e.target.classList.contains('selected')) {
            if (e.target.value != 'on') {
                e.target.classList.add('selected')
                arr.push(e.target.value);
                ele.style.background = "#2ee38f";
            }
        } else {
            e.target.classList.remove('selected')
            var index = arr.indexOf(e.target.value);
            if (index > -1) {
                arr.splice(index, 1);
            }
            ele.style.background = "white";
        }
        updateselect();
    });
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
<script src="JS/Home.js"></script>
<!--    <script>
$(window).on('wrapper',function(event){
$('body').removeClass('preloading');
$('.wrapper').delay(1000).fadeOut('fast');
});
</script>-->

<script>
    var loader = document.getElementById("wrapper");
    window.addEventListener("load", setTimeout(function () {
        loader.style.display = "none";

    }, 1500));
</script>

<script >
    const map = new Map();

    function plus(button) {
        var bu = document.getElementsByClassName('plus-btn');
        for (var i = 0; i < bu.length; i++) {
            if (bu[i] == button) {
                /*add1*/
                var input = document.getElementsByClassName("input-number");
                var oldValue = parseInt(input[i].value) + 1;
                input[i].value = oldValue;
                /*change total price*/
                var price = document.getElementsByClassName("col-price");
                var totalPrice = document.getElementsByClassName("col-total-price");
                totalPrice[i].innerHTML = parseInt(totalPrice[i].innerHTML) + parseInt(price[i].innerHTML);
                /*add to combo list*/
                var oderedList = document.getElementById("odered-combo");
                var comboName = document.getElementsByClassName("combo-name");
                if (!map.has(comboName[i].innerHTML)) {
                    map.set(comboName[i].innerHTML, 1);
                } else {

                    map.set(comboName[i].innerHTML, parseInt(map.get(comboName[i].innerHTML)) + 1);
                }
                /*in*/
                let text = "";
                map.forEach(function (value, key) {
                    text += key + '(' + value + '), ';
                })
                oderedList.innerHTML = text;

            }


        }
    }

    function minus(button) {
        var bu = document.getElementsByClassName('minus-btn');
        for (var i = 0; i < bu.length; i++) {
            if (bu[i] == button) {
                /*minus1*/
                var input = document.getElementsByClassName("input-number");
                if (parseInt(input[i].value) > 0) {
                    var oldValue = parseInt(input[i].value) - 1;
                    input[i].value = oldValue;
                    /*change total price*/
                    var price = document.getElementsByClassName("col-price");
                    var totalPrice = document.getElementsByClassName("col-total-price");
                    totalPrice[i].innerHTML = parseInt(totalPrice[i].innerHTML) - parseInt(price[i].innerHTML);
                    /*remove from combo list*/
                    var oderedList = document.getElementById("odered-combo");
                    var comboName = document.getElementsByClassName("combo-name");
                    if (parseInt(map.get(comboName[i].innerHTML)) == 1) {
                        console.log(map.get(comboName[i].innerHTML));
                        map.delete(comboName[i].innerHTML, 1);
                    } else {

                        map.set(comboName[i].innerHTML, map.get(comboName[i].innerHTML) - 1);
                    }
                    let text = "";
                    map.forEach(function (value, key) {
                        text += key + '(' + value + '), ';
                    })
                    oderedList.innerHTML = text;
                } else {
                    input[i].value = 0;
                }
            }

        }
    }
    /*INPUT
    */
    function comboUpdate(element){
        var input = document.getElementsByClassName("input-number");
        for (var i = 0; i < input.length; i++) {
        if(input[i]==element){
            console.log("a");
            var price = document.getElementsByClassName("col-price");
            var totalPrice = document.getElementsByClassName("col-total-price");
            if(parseInt(input[i].value) >= 0){
            console.log(input[i].value + price[i].innerHTML)
            totalPrice[i].innerHTML = parseInt(input[i].value) * parseInt(price[i].innerHTML); 
            /*add in to combo*/
            var oderedList = document.getElementById("odered-combo");
            var comboName = document.getElementsByClassName("combo-name");
              
                    map.set(comboName[i].innerHTML, input[i].value);
                
            } else{
                totalPrice[i].innerHTML = 0;
                input[i].value=0;
            }
            /*in*/
            let text = "";
                map.forEach(function (value, key) {
                    text += key + '(' + value + '), ';
                })
                oderedList.innerHTML = text;
        }
    
    }
}
    
</script>
<script
    src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
<script
    src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-7549a40147ccd0ba0a6b5373d87e770e49bb4689f1c2dc30cccc7463f207f997.js"></script>
<script
    src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script>
<script
    src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
<jsp:include page="../Page/Footer.jsp" />


