from django.db import models
from django.contrib.auth.models import User
from django.utils.formats import number_format
import datetime

class Type(models.Model):
	name = models.CharField(max_length=200)
	user = models.ForeignKey(User)

	class Meta:
		db_table = "product_type"

	def __unicode__(self):
		return self.name

class Product(models.Model):
	name = models.CharField(max_length=200)
	date = models.DateField()
	end_date = models.DateField()
	value = models.FloatField()
	obs = models.CharField(max_length=200, blank=True)
	type = models.ForeignKey(Type)
	user = models.ForeignKey(User)
	status = models.BooleanField()

	@property
	def number_formated(self):
		return u"R$ %s" % number_format(self.value, 2) 

	def current_month(self):
		return self.date.date() == datetime.date.today()

	class Meta:
		db_table = "product"

class ProductLog(models.Model):
	product = models.ForeignKey(Product)
	value = models.FloatField()
	date = models.DateField()

	class Meta:
		db_table = "product_log"