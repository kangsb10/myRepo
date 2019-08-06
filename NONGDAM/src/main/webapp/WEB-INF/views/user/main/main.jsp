<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>

<div class='blurred-container'>
        <div class="motto">
            <div>Get</div>
            <div class="border no-right-border">응</div><div class="border">애</div>
            <div>Done</div>
        </div>
        <div class="img-src" style="background-image: url('${pageContext.request.contextPath }/img/cover_4.jpg')"></div>
        <div class='img-src blur' style="background-image: url('${pageContext.request.contextPath }/img/cover_4_blur.jpg')"></div>
   </div>

<div class="main">
    <div class="container tim-container">
       
        <div class="tim-title">
            <h2>Basic Elements</h2>
        </div>
        
        <div id="buttons">
                <div class="tim-title">
                    <h3>Buttons <small> Pick your class </small></h3>
                </div>
                
                <div class="row tim-row">
                    <div class="col-md-6">
                        <div class="pick-class">
                            <span class="pick-class-label label-default label-fill label-tooltip" data-toggle="tooltip" data-placement="top" title="Default" new-class="btn-default"> </span>
                            <span class="pick-class-label label-primary label-fill label-tooltip" data-toggle="tooltip" data-placement="top" title="Primary" new-class="btn-primary"> </span>
                            <span class="pick-class-label label-info label-fill label-tooltip" data-toggle="tooltip" data-placement="top" title="Info" new-class="btn-info"> </span>
                            <span class="pick-class-label label-success label-fill label-tooltip" data-toggle="tooltip" data-placement="top" title="Success" new-class="btn-success"> </span>
                            <span class="pick-class-label label-warning label-fill label-tooltip" data-toggle="tooltip" data-placement="top" title="Warning" new-class="btn-warning"> </span>
                            <span class="pick-class-label label-danger label-fill label-tooltip" data-toggle="tooltip" data-placement="top" title="Danger" new-class="btn-danger"> </span>
                        </div>
                    </div>
                </div>
                <div class="row tim-row" id="display-buttons" data-class="btn-info">
                    <div class="col-md-3 col-sm-6">
                        <button href="#fakelink" class="btn btn-block btn-lg btn-info">Default Button</button>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <button href="#fakelink" class="btn btn-block btn-lg btn-info btn-fill">Filled Button</button>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <button href="#fakelink" class="btn btn-block btn-lg btn-info btn-round">Rounded Button</button>
                    </div>
                    
                    <div class="col-md-3 col-sm-6">
                        <button href="#fakelink" class="btn btn-block btn-lg btn-info btn-simple">Simple Button</button>
                    </div>
                </div> <!-- end row -->               
        </div>
    <!-- end buttons div -->
    
        <div id="inputs">
            <div class="tim-title">
                <h3>Inputs</h3>
            </div>
            
             <div class="row">
                    <div class="col-sm-3">
                	<div class="form-group">
        	        	<input type="text" value="" placeholder="Inactive" class="form-control" />
                	</div>          
                </div>
                
                <div class="col-sm-3">
                  <div class="form-group has-success">
                    <input type="text" value="Success" class="form-control" />
                  </div>
                </div>
                
                <div class="col-sm-3">
                  <div class="form-group has-error has-feedback">
                    <input type="text" value="Error" class="form-control" />
                    <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                  </div>
                </div>
    
                <div class="col-sm-3">
                	<div class="input-group">
                	<!-- 	   Since the css properties cannot check the previous sibling of an element and for the design consistency we recommend to use the "input-group-addon" after the "form-control" like in this example -->
                      <input type="text" value="Group Addon" class="form-control">
                      <span class="input-group-addon"><i class="fa fa-group"></i></span>
                    </div>       
                </div>
              </div> <!-- end row -->
            
            <div class="row">
                <div class="col-sm-3">
                    <div class="tim-title">
                        <h3>Checkboxes</h3>
                    </div>
                    
                      <label class="checkbox" for="checkbox1">
                        <input type="checkbox" value="" id="checkbox1" data-toggle="checkbox">
                        Unchecked
                      </label>
                      <label class="checkbox" for="checkbox2">
                        <input type="checkbox" value="" id="checkbox2" data-toggle="checkbox" checked>
                        Checked
                      </label>
                      <label class="checkbox" for="checkbox3">
                        <input type="checkbox" value="" id="checkbox3" data-toggle="checkbox" disabled>
                        Disabled unchecked
                      </label>
                      <label class="checkbox" for="checkbox4">
                        <input type="checkbox" value="" id="checkbox4" data-toggle="checkbox" disabled checked>
                        Disabled checked
                      </label>
                </div>
                
                <div class="col-sm-3">
                    <div class="tim-title">
                        <h3>Radio Buttons</h3>
                    </div>
                    
                       <label class="radio">
                        <input type="radio" name="optionsRadios" data-toggle="radio" id="optionsRadios1" value="option1">
                        <i></i>Radio is off
                      </label>
                      <label class="radio">
                        <input type="radio" name="optionsRadios" data-toggle="radio" id="optionsRadios2" value="option1" checked>
                        <i></i>Radio is on
                      </label>
            
                      <label class="radio">
                        <input type="radio" name="optionsRadiosDisabled" data-toggle="radio" id="optionsRadios3" value="option2" disabled>
                        <i></i>Disabled radio is off
                      </label>
                      <label class="radio">
                        <input type="radio" name="optionsRadiosDisabled" data-toggle="radio" id="optionsRadios4" value="option2" checked disabled>
                        <i></i>Disabled radio is on
                      </label>
                    
                </div>      
                
                <div class="col-sm-3">
                    <div class="tim-title">
                        <h3>Switches</h3>
                        <!--                    
                        
                        The colors for checkbox: ct-blue[default], ct-azure, ct-orange, ct-green, ct-red    
                        <input type="checkbox" checked data-toggle="switch" class="ct-red"/> 
                         
                         -->
                        <input type="checkbox" checked data-toggle="switch" class="ct-info"/>
                        <input type="checkbox" data-toggle="switch" />
                        <h3>Switches with icons</h3>
                        <div class="switch"
                          data-on-label="<i class='fa fa-check'></i>"
                          data-off-label="<i class='fa fa-times'></i>">
                          <input type="checkbox" checked/>
                        </div>
                        <div class="switch"
                          data-on-label="<i class='fa fa-check'></i>"
                          data-off-label="<i class='fa fa-times'></i>">
                          <input type="checkbox"/>
                        </div>
                    </div>
                </div> 
  
                <div class="col-sm-3">
                </div>               
            </div><!--  end row -->
        </div><!--  end inputs -->
        
        <div id="menu-dropdown">
            <div class="row">
                <div class="col-md-7">
                    <div class="tim-title">
                        <h3>Menu & Dropdown</h3>
                    </div>
                    <div id="navbar">
                        <nav class="navbar navbar-default">
                          <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                              </button>
                              <a class="navbar-brand" href="#gsdk">Brand</a>
                            </div>
                        
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                              <ul class="nav navbar-nav">
                                <li class="active"><a href="#gsdk">Link</a></li>
                                <li><a href="#gsdk">Link</a></li>
                                <li class="dropdown">
                                  <a href="#gsdk" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                                  <ul class="dropdown-menu">
                                    <li><a href="#gsdk">Action</a></li>
                                    <li><a href="#gsdk">Another action</a></li>
                                    <li><a href="#gsdk">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#gsdk">Separated link</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#gsdk">One more separated link</a></li>
                                  </ul>
                                </li>
                              </ul>
                            </div><!-- /.navbar-collapse -->
                          </div><!-- /.container-fluid -->
                        </nav>
                    </div><!--  end navbar -->
                </div>
            </div> <!-- end row -->
        </div> <!-- end menu-dropdown -->
        <div class="tim-title">
        <h3>Transparent Navigation
             <a href="navbar-transparent.html" target="_blank" class="btn btn-info btn-fill">Live Preview</a>
        </h3>
    </div>
    </div>
</div>



</body>
</html>