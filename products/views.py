# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.template import RequestContext
from django.http import HttpResponseRedirect

from models import Product, Type
from forms import FormProduct, FormProductType

@login_required
def product(request):
	items = Product.objects.filter(user=request.user)
	return render_to_response('product.html', {'items': items, 'menu': 'product', 'user': request.user})

@login_required
def product_item(request, id):
	item = get_object_or_404(Product, pk=id, user=request.user)

	if request.method == 'POST':
		form = FormProduct(request.POST, request.FILES, instance=item)

		if form.is_valid():
			form.save()
			return HttpResponseRedirect('/')

	else:
		form = FormProduct(instance=item)

	return render_to_response('product_item.html', {'form': form}, context_instance=RequestContext(request))

@login_required
def product_new(request):
	if request.method == 'POST':
		form = FormProduct(request.POST)

		if form.is_valid():
			item = form.save(commit=False)
			item.user = request.user
			item.save()
			return HttpResponseRedirect('/')
	else:
		form = FormProduct()

	return render_to_response('product_item.html', {'form': form}, context_instance=RequestContext(request))

@login_required
def product_delete(request, id):
	Product.objects.get(pk=id).delete()
	return HttpResponseRedirect('/')

@login_required
def type(request):
	items = Type.objects.filter(user=request.user)
	return render_to_response('type.html', {'items': items, 'menu': 'type'})

@login_required
def type_item(request, id):
	item = get_object_or_404(Type, pk=id)

	if request.method == 'POST':
		form = FormProductType(request.POST, request.FILES, instance=item)

		if form.is_valid():
			form.save()
			return HttpResponseRedirect('/type')

	else:
		form = FormProductType(instance=item)

	return render_to_response('type_item.html', {'form': form}, context_instance=RequestContext(request))

@login_required
def type_new(request):
	if request.method == 'POST':
		form = FormProductType(request.POST, request.FILES)

		if form.is_valid():
			item = form.save(commit=False)
			item.user = request.user
			item.save()
			return HttpResponseRedirect('/type')
	else:
		form = FormProductType()

	return render_to_response('type_item.html', {'form': form}, context_instance=RequestContext(request))

@login_required
def type_delete(request, id):
	Type.objects.get(pk=id).delete()
	return HttpResponseRedirect('/type')