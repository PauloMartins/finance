from django.db import models

class Type(models.Model):
	name = models.CharField(max_length=200)

class User(models.Model):
	name = models.CharField(max_length=200)
	last_name = models.CharField(max_length=200)
	email = models.CharField(max_length=300)
	password = models.CharField(max_length=200)

class Product(models.Model):
	name = models.CharField(max_length=200)
	obs = models.CharField(max_length=200)
	date = models.DateField()
	end_date = models.DateField()
	value = models.FloatField()
	type = models.ForeignKey(Type)
	user = models.ForeignKey(User)