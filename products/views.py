# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from django.contrib.auth.decorators import login_required
from django.template import RequestContext
from models import Product
from forms import FormProduct, FormProductType

@login_required
def index(request):
	items = Product.objects.filter(user=request.user)
	return render_to_response('index.html', {'items': items})

@login_required
def new(request):
	if request.method == 'POST':
		form = FormProduct(request.POST, request.FILES)

		if form.is_valid():
			item = form.save(commit=False)
			item.user = request.user
			item.save()
			return render_to_response('index.html')
	else:
		form = FormProduct()

	return render_to_response('new.html', {'form': form}, context_instance=RequestContext(request))

@login_required
def new_type(request):
	if request.method == 'POST':
		form = FormProductType(request.POST, request.FILES)

		if form.is_valid():
			form.save()
			return render_to_response('index.html')
	else:
		form = FormProductType()

	return render_to_response('new_type.html', {'form': form}, context_instance=RequestContext(request))