# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from django.utils import simplejson
from datetime import date

from models import Product, Type, ProductLog
from forms import FormProduct, FormProductType

import datetime

@login_required
def product(request, options = None):
	total = 0
	items = Product.objects.filter(user=request.user).order_by('date').extra(where=['(YEAR(end_date) > %s) OR (YEAR(end_date) = %s AND MONTH(end_date) >= %s)'], params=[datetime.date.today().year, datetime.date.today().year, datetime.date.today().month])

	if options == 'paid':
		items = items.filter(productlog__date__month=datetime.date.today().month, productlog__date__year=datetime.date.today().year).distinct()
	elif options == 'nonpaid':
		items = items.exclude(productlog__date__month=datetime.date.today().month, productlog__date__year=datetime.date.today().year).distinct()

	for item in items:
		item.paid = ProductLog.objects.filter(product_id=item.id, date__month=datetime.date.today().month, date__year=datetime.date.today().year)
		total += item.value

	return render_to_response('product.html', {'items': items, 'menu': 'product', 'user': request.user, 'options': options, 'total': total})

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

	return render_to_response('product_item.html', {'form': form, 'menu': 'product', 'edit': True}, context_instance=RequestContext(request))

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

	return render_to_response('product_item.html', {'form': form, 'menu': 'product'}, context_instance=RequestContext(request))

@login_required
def product_delete(request, id):
	Product.objects.get(pk=id).delete()
	return HttpResponseRedirect('/')

@login_required
def product_status(request, id, status):
	product = Product.objects.get(pk=id)

	if status == '1':
		status = True
	else:
		status = False

	if status == True:
		log = ProductLog(product_id=product.id, value=product.value, date=date.today())
		log.save();

	return HttpResponse(simplejson.dumps({'status': True}), mimetype="application/json")

@login_required
def type(request):
	items = Type.objects.filter(user=request.user)
	return render_to_response('type.html', {'items': items, 'menu': 'type', 'user': request.user})

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

	return render_to_response('type_item.html', {'form': form, 'menu': 'type', 'edit': True}, context_instance=RequestContext(request))

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

	return render_to_response('type_item.html', {'form': form, 'menu': 'type'}, context_instance=RequestContext(request))

@login_required
def type_delete(request, id):
	Type.objects.get(pk=id).delete()
	return HttpResponseRedirect('/type')