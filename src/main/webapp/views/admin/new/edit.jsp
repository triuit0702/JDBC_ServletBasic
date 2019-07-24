<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Chỉnh sửa bài viết</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${not empty message}">
                        <div class="alert alert-${alert}">
                                ${message}
                        </div>
                    </c:if>
                    <form id="formSubmit">

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Thể loại</label>
                            <div class="col-sm-9">
                                <select class="form-control" id="categoryCode" name="categoryCode">
                                    <c:if test="${not empty model.categoryCode}">
                                        <c:forEach var="item" items="${categories}">
                                            <c:if test="${item.code == model.categoryCode}">
                                                <option value="${item.code}" selected="selected">${item.name}</option>
                                            </c:if>
                                            <c:if test="${item.code != model.categoryCode}">
                                                <option value="${item.code}">${item.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${empty model.categoryCode}">
                                        <option value="">Chon thể loại bài viết</option>
                                        <c:forEach var="item" items="${categories}">
                                                <option value="${item.code}">${item.name}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                        </div>

                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="title" name="title" value="${model.title}"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="thumbnail" name="thumbnail" value=""/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="shortdescription" name="shortdescription" value="${model.shortdescription}"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="content" name="content" value="${model.content}"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <c:if test="${not empty model.id}">
                                <div class="col-sm-12">
                                    <input type="button" class="btn-white btn-warning btn-bold" id="btnAddorUpdateNew"  value="Cập nhật bài viết"/>
                                </div>
                            </c:if>
                            <c:if test="${empty model.id}">
                                <div class="col-sm-12">
                                    <input type="button" class="btn-white btn-warning btn-bold" id="btnAddorUpdateNew"  value="Thêm mới bài viết"/>
                                </div>
                            </c:if>
                        </div>

                        <input type="hidden" value="${model.id}" id="id" name="id"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#btnAddorUpdateNew').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        })

        var id = $('#id').val();
        if (id == "") {
            addNew(data);
        } else {
            updateNew(data);
        }
    });

    function addNew(data) {
        $.ajax({
            url: '${APIurl}',
            contentType: 'application/json',
            type: 'POST',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                alert('Thêm mới thành công')
            },
            error: function (error) {
                console.log(error)
            }

        });
    }

    function updateNew(data) {
        $.ajax({
            url: '${APIurl}',
            contentType: 'application/json',
            type: 'PUT',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                alert('Cập nhật thành công')
            },
            error: function (error) {
                console.log(error)
            }

        });
    }
</script>
</body>
</html>
