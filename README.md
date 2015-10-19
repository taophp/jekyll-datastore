#Jekyll-Datastore

## Introduction
Jekyll-Datastore is basically [Jekyll-DB](https://github.com/rypan/jekyll-db) augmented with some improvements. If your not familiar with Jekyll-DB, you should  first read its [old README bellow](#oldreadme). Both suppose that you are familiar with [Jekyll](http://jekyllrb.com).

Planed improvements are :

* tables of structures,
* commands to create and edit tables and create records

Note that where Jekyll documentation talks about posts, and Jekyll-DB about items or entries, we talk about records. Our records are what was blog posts for Jekyll.

## About tables of structures

Think tables as in SQL, structures as in C.

### Tables
Basically, Jekyll-DB uses YAML data stored in headers of posts to provide HTML tables and make the user able to manipulate them with JavaScript. Some data fields are expected to fill the table and make the whole stuff work well but there is no other requirement.

Jekyll-datastore adds the concept of tables. All records are expected to have at least one field named `_jsd_table`. `_jds_table` is expected to be a string, chosen in the list of the existing tables.

The home page of your Jekyll-datastore will present all your records. But a navigation menu enables you to access records of only one table. Click on the table name, and you get only its records, searchable and sortable.

### Structures
Both JSON and YAML data are NoSQL : records do not below to any table, and no field are required by design, so you can store any data, any structure easily. It's fine, but when you need to present the data to the final user, you need to know which field to use. So when Jekyll-datastore displays a table, it should expecte your records to have some fields present. Expected data depend on the table declaration you made (we will see how later). Of course, expected data are not required --- it's YAML, you know --- but you should think twice before removing them. And, of course, you are not limited to the expected data, you can had as many as you need.

As expected data may be complexe and structured, it reminds us the C structures. So we call them "structures".

## Commands

Jekyll-datastore provides some basic commands to make your work easier. All commands work on the commandline and are stored in the special directory `_`. So, if you are in your project directory, all commands should be called this way :

	$ _/mycommand <param1> <param2>

or, if you are using Windows :

	_\mycommand <param1> <param2>

Futher, we will gave our exemple using the Unix form only.

### Create table

	$ _/newtable <mytable>

Then your text editor opens with the default structure for your new table. You can change it to fit your needs. This file will then be used as a model when you create a new record in this table. It is stored in the special directory `_tables` and it is named using the first parameter you gave to the command `<mytable>`.

Please do not use `main` as table name, it is reserved.

Please do not create the structure file a other way, as some extra work is required.

### Edit structure

You may edit this file yourself manually with no arm. Or you can use the command :

	$ _/edittable <matable>

Then your text editor opened the structure file.

### Create record

Now that you have a structure, you can add a record to it this way :

	$ _/newrecord <matable>

Then an new file is opened in your text editor, pre-filled with the structure of the table.

### Using commands to manipulate the _main_ table

The main table contains all your records of all your tables and even the records that do not belong to any table. The main table is displayed on the default home page of your project.

You can edit its structure to fit your needs. You can create a new record in this table using the command `_/newrecord main`.

<a name="oldreadme"></a>
## Old Readme from Jekyll-DB

An easy way to use Jekyll and Github Pages as a "database".

See it in action: [http://taophp.github.io/jekyll-datastore](http://taophp.github.io/jekyll-datastore)

### Use posts as entries

```
---
layout: entry
company-name: AchieveMint
city: San Francisco
state: California
employees: 100

categories:
- startup

tags:
- wellness
- consumer
- employer
---
```

### Output your fields in a table

```
<tbody class="list">
{% for post in site.posts %}
	<tr>
		<td class="name">{{ post.company-name }}</td>
		<td class="city">{{ post.city }}</td>
		<td class="category">{{ post.categories }}</td>
		<td class="tags">{{ post.tags | array_to_sentence_string }}</td>
	</tr>
{% endfor %}
</tbody>
```

### Index the appropriate fields

```
<script type="text/javascript">

var options = {
  valueNames: ['name', 'city', 'category', 'tags']
};

var entryList = new List('entry-list', options);

</script>
```

### Output your data as JSON

```
---
layout: none
---
[{% for post in site.posts %}{
	"company-name": "{{post.company-name}}",
	"city": "{{post.city}}",
	"state": "{{post.state}}",
	"employees": "{{post.employees}}",
	"tags": "{{ post.tags | array_to_sentence_string }}",
	"categories": "{{post.categories}}"
}{% if forloop.rindex0 > 0 %},{% endif %}{% endfor %}]
```

### Credits

Jekyll-datastore started from [Jekyll-DB](https://github.com/rypan/jekyll-db) which author said that all the credits go to [Jekyll](http://jekyllrb.com/), [ListJS](http://listjs.com/) + [Bootstrap](http://getbootstrap.com/): he just pulled the pieces together.
