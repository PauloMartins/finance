# -*- coding: utf-8 -*-
from django import forms
from django.forms import ModelForm
from products.models import Product, Type

class FormProduct(forms.ModelForm):

	class Meta:
		model = Product
		fields = {'name', 'obs', 'date', 'end_date', 'value', 'type'}

class FormProductType(forms.ModelForm):

	class Meta:
		model = Type
		fields = {'name'}